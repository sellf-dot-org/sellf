class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest

      t.string :currency

      t.string :stripe_publishable_key
      t.string :stripe_secret_key
      t.string :stripe_user_id
      t.string :stripe_account_type
      t.text :stripe_account_status, default: '{}'

      t.timestamps
    end
  end
end
