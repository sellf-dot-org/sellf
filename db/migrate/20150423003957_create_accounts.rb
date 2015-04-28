class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.boolean :active

      t.references :accountable, polymorphic: true, index: true

      t.timestamps null: false
    end
  end
end
