class AddTagToScream < ActiveRecord::Migration
  def change
    add_column :screams, :tag, :string
  end
end
