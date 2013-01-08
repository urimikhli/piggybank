class AddUserToScores < ActiveRecord::Migration
  def self.up
    add_column :scores, :user_id, :int
  end

  def self.down
    remove_column :scores, :user_id
  end
end
