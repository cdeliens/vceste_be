class CreateInstagramServices < ActiveRecord::Migration
  def change
    create_table :instagram_services do |t|

      t.timestamps
    end
  end
end
