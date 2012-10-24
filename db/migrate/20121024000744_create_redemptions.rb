class CreateRedemptions < ActiveRecord::Migration
  def self.up
    create_table :redemptions do |t|
      t.string :affiliate
      t.integer :amount

      t.timestamps
    end
  end

  def self.down
    drop_table :redemptions
  end
end
