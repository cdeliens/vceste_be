class Page < ActiveRecord::Base
  attr_accessible :body, :category_id, :title
  belongs_to :category
  
end
