class RemoveParentIdFromPages < ActiveRecord::Migration
  def up
    remove_column :pages, :parent_id
  end

  def down
    remove_column :pages, :parent_id, :integer
  end
end
