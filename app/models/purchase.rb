class Purchase < ActiveRecord::Base
  hash_id salt: ENV["SALT"]

  belongs_to :user
  belongs_to :datum

  monetize :amount_cents
end
