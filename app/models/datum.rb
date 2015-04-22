class Datum < ActiveRecord::Base
  belongs_to :user
  has_attached_file :datagram
  validates_attachment_presence :datagram
  do_not_validate_attachment_file_type :datagram
end
