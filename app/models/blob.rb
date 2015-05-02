class Blob < ActiveRecord::Base
  has_one :datum, as: :datable, dependent: :destroy

  accepts_nested_attributes_for :datum

  # def to_param
  #   datum.to_param
  # end
end
