class CreateScreams < ActiveRecord::Migration
  def change
    create_table :screams do |t|
      t.string :body
      t.string :owner
      t.string :media_url
      t.string :provider

      t.timestamps
    end
  end
end
