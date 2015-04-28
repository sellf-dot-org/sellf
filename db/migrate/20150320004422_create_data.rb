class CreateData < ActiveRecord::Migration
  def change
    create_table :data do |t|
      t.integer :user_id

      t.string :title
      t.text :description

      t.integer :price_cents

      t.references :datable, polymorphic: true, index: true

      t.timestamps null: false
    end
  end
end
