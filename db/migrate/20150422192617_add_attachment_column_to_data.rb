class AddAttachmentColumnToData < ActiveRecord::Migration
  def self.up
    add_attachment :data, :datagram
  end

  def self.down
    remove_attachment :data, :datagram
  end
end
