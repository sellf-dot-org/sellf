class CreatePurchases < ActiveRecord::Migration
  def change
    create_table :purchases do |t|
      t.belongs_to :user, index: true
      t.belongs_to :datum, index: true

      t.integer :amount_cents

      t.timestamps null: false
    end
  end
end
