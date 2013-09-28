class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.datetime :date
      t.integer :place_id
      t.integer :cover
      t.text :body

      t.timestamps
    end
  end
end
