class Purchase < ActiveRecord::Base
  belongs_to :user
  belongs_to :datum

  monetize :amount_cents
end
