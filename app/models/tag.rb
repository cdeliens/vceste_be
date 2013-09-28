class Tag < ActiveRecord::Base
  attr_accessible :tag
  belongs_to :taggeable, polymorphic: true
end
