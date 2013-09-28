require 'spec_helper'

describe Tag do
  it { should belong_to :taggeable }
end
