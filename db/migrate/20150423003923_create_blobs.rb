class CreateBlobs < ActiveRecord::Migration
  def change
    create_table :blobs do |t|
      t.attachment :file

      t.timestamps null: false
    end
  end
end
