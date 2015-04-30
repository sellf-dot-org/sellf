class Datum < ActiveRecord::Base
  hash_id salt: ENV["SALT"] + "for data"

  has_many :purchases
  belongs_to :user

  has_many :buyers, :through => :purchases, :source => :user

  belongs_to :datable, :polymorphic => true

  monetize :price_cents

  def pretty_price
    "$" + price.to_s
  end
end
