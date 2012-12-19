class CreateGames < ActiveRecord::Migration
  def self.up
    create_table :games do |t|
      t.string :game_name
      t.string :developer_name

      t.timestamps
    end
  end

  def self.down
    drop_table :games
  end
end
