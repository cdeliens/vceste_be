class Post < ActiveRecord::Base
  attr_accessible :body, :category_id, :order, :title, :humanize_date
  belongs_to :category
end
