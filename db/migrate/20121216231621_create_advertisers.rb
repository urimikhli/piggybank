class CreateAdvertisers < ActiveRecord::Migration
  def self.up
    create_table :advertisers do |t|
      t.string :name
      t.float :conversion_factor
      t.float :dollar_amount

      t.timestamps
    end
  end

  def self.down
    drop_table :advertisers
  end
end
