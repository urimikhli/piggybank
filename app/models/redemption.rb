class Redemption < ActiveRecord::Base
  
  
   def self.byGame
    Redemption.select("redemptions.advertiser_name,redemptions.developer_name,redemptions.game_name, sum(redemptions.amount) as sum_amount").group('redemptions.advertiser_name,redemptions.developer_name,redemptions.game_name')
   end
   
   def self.byGameNoAdv
    Redemption.select("redemptions.game_name, sum(redemptions.amount) as sum_amount").group('redemptions.game_name')
   end
   
   def self.byGameByAdv
    Redemption.select("redemptions.advertiser_name,redemptions.developer_name,redemptions.game_name, sum(redemptions.amount) as sum_amount").group('redemptions.advertiser_name,redemptions.developer_name,redemptions.game_name')
   end
   
end
