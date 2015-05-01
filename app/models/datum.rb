class Datum < ActiveRecord::Base
  hash_id salt: ENV["SALT"] + "for data"

  has_many :purchases, dependent: :destroy
  belongs_to :user

  has_many :buyers, :through => :purchases, :source => :user

  belongs_to :datable, :polymorphic => true, dependent: :destroy

  monetize :price_cents

  def pretty_price
    "$" + price.to_s
  end

  def short_description(cutoff = 40)
    if description.length < cutoff
      description
    else
      (description[0..cutoff] + '&hellip;').html_safe
    end
  end
end
