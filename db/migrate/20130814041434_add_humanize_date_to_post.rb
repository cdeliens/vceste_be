class AddHumanizeDateToPost < ActiveRecord::Migration
  def change
    add_column :posts, :humanize_date, :string
  end
end
