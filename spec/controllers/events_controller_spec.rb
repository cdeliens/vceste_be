require 'spec_helper'

describe EventsController do
  describe "GET index" do
    it "has a 200 status code" do
      get :index, :format => :json
      response.status.should == 200
    end
    it "should fail if request is not json" do
      get :index
      response.status.should == 406
    end
  end
  describe "GET index JSON BODY" do
    before(:each) do
      5.times { @event = create(:event) }
    end
    after(:all) do
      Event.destroy_all
    end
    it "should have a body full of events" do
      get :index, :format => :json
      response.body.should == Event.all().to_json(include: :place)
    end
    it "should have a place attached" do
      get :index, :format => :json
      response_hash = JSON.parse(response.body)
      response_hash[0].should have_key("place") 
    end

  end
  describe "callback" do
    it "should have a callback" do
      get :index, :format => :json, callback: "thisIsMyCallback"
      response.body.should == "thisIsMyCallback([])"
    end
  end
end
