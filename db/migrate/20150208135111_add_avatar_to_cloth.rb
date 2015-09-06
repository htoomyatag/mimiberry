class AddAvatarToCloth < ActiveRecord::Migration
  def self.up
    add_attachment :cloths, :avatar
  end

  def self.down
    remove_attachment :cloths, :avatar
  end
end
