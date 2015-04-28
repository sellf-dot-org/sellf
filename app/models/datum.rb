class Datum < ActiveRecord::Base
  has_many :purchases
  belongs_to :user

  has_many :users, :through => :purchases, :as => :buyers

  belongs_to :datable, :polymorphic => true

  monetize :price_cents
end
