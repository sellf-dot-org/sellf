class Blob < ActiveRecord::Base
  has_one :datum, as: :datable, dependent: :destroy

  accepts_nested_attributes_for :datum

  has_attached_file :file

  do_not_validate_attachment_file_type :file
  # do_not_validate_attachment_content_type :file

  # def to_param
  #   datum.to_param
  # end
end
