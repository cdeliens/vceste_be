require 'spec_helper'

describe Place do
  it { should have_many(:events) }
end
