class CreateData < ActiveRecord::Migration
  def change
    create_table :data do |t|
      t.string :title
      t.text :description
      t.references :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :data, :users
  end
end
