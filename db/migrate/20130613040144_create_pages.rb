class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.integer :parent_id
      t.string :title
      t.string :body
      t.integer :category_id

      t.timestamps
    end
  end
end
