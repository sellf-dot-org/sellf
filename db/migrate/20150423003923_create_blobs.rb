class CreateBlobs < ActiveRecord::Migration
  def change
    create_table :blobs do |t|
      t.string :blob_url

      t.timestamps null: false
    end
  end
end
