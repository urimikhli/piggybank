class CreateRedemptions < ActiveRecord::Migration
  def self.up
    create_table :redemptions do |t|
      t.string :advertiser
      t.string :redemption_type
      t.string :game_name
      t.string :developer_name
      t.integer :amount

      t.timestamps
    end
  end

  def self.down
    drop_table :redemptions
  end
end
