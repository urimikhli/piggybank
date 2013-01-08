class AddUserToRedemptions < ActiveRecord::Migration
  def self.up
    add_column :redemptions, :user_id, :int
  end

  def self.down
    remove_column :redemptions, :user_id
  end
end
