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

  context "POST" do
    before(:each) do
      @place = create(:place)
      @event_hash = {:name=>"Helena Hayes",
                     date: Time.now, 
                     place_id: @place.id, 
                     :body=>"Eos rerum reiciendis odit et vitae ut harum. Accusantium pariatur veniam. Repellendus similique exercitationem nostrum nobis consequuntur provident illum. Vel dignissimos sunt saepe voluptatem."
                   }
    end
    after(:all) do
      Event.destroy_all
      Place.destroy_all
    end
    describe "Create" do
      it "should create a new event" do
        post :create, event: @event_hash, format: :json
        response.status.should == 201
      end
      it "should create a new event with a place" do
        post :create, event: @event_hash, format: :json
        Event.last().place.should == @place
      end
    end
  end
end
