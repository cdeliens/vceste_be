class AddTaggeableToTag < ActiveRecord::Migration
  def change
    add_column :tags, :taggeable_id, :integer
    add_column :tags, :taggeable_type, :string
  end
end
