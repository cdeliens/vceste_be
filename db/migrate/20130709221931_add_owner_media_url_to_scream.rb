class AddOwnerMediaUrlToScream < ActiveRecord::Migration
  def change
    add_column :screams, :owner_media_url, :string
  end
end
