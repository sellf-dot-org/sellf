class Blob < ActiveRecord::Base
  has_one :datum, as: :datable, dependant: :destroy

  accepts_nested_attributes_for :datum

  has_attached_file :file

  do_not_validate_attachment_file_type :file
  # do_not_validate_attachment_content_type :file

end
