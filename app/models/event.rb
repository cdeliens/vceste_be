class Event < ActiveRecord::Base
  attr_accessible :body, :cover, :date, :name, :place_id, :tags, :place, :tags
  belongs_to :place
  has_many :tags, as: :taggeable
end
