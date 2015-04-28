class Account < ActiveRecord::Base
  has_one :datum, :as => :datable
  belongs_to :accountable, :polymorphic => true
end
