require 'spec_helper'

describe Event do
  it { should belong_to(:place) }
  it { should have_many(:tags) }

  before(:each) do
    @event = build(:event)
  end

  it "tests if an event has a place" do
    @event.place.should be_true
  end
  it "tests if an event has a tags" do
    @event.tags.should be_true
  end
end
