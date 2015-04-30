class Purchase < ActiveRecord::Base
  hash_id salt: ENV["SALT"] + "for purchases"

  belongs_to :user
  belongs_to :datum

  monetize :amount_cents
end
