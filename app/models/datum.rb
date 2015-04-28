class Datum < ActiveRecord::Base
  has_many :purchases
  belongs_to :user

  has_many :buyers, :through => :purchases, :source => :user

  belongs_to :datable, :polymorphic => true

  monetize :price_cents
end
