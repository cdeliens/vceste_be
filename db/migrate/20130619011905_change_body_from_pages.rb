class ChangeBodyFromPages < ActiveRecord::Migration
  def up
    remove_column :pages, :body
    add_column :pages, :body, :text
  end

  def down
    remove_column :pages, :body
    add_column :pages, :body, :string
  end
end
