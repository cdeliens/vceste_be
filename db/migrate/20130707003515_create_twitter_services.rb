class CreateTwitterServices < ActiveRecord::Migration
  def change
    create_table :twitter_services do |t|

      t.timestamps
    end
  end
end
