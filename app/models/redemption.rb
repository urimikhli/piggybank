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
   
   #############
   #by user
   ########   
   def self.byGameByUserId(id=0)
    Redemption.select("redemptions.advertiser_name,redemptions.developer_name,redemptions.game_name, sum(redemptions.amount) as sum_amount").where('redemptions.user_id=?',id).group('redemptions.advertiser_name,redemptions.developer_name,redemptions.game_name')
   end
   
   def self.byGameNoAdvByUserId(id=0)
    Redemption.select("redemptions.game_name, sum(redemptions.amount) as sum_amount").where('redemptions.user_id=?',id).group('redemptions.game_name')
   end
   
   def self.byGameByAdvByUserId(id=0)
    Redemption.select("redemptions.advertiser_name,redemptions.developer_name,redemptions.game_name, sum(redemptions.amount) as sum_amount").where('redemptions.user_id=?',id).group('redemptions.advertiser_name,redemptions.developer_name,redemptions.game_name')
   end
   
   ########
   #by advertiser
   #########
   def self.byGameByAdvName(adv_name="")
    Redemption.select("redemptions.advertiser_name,redemptions.developer_name,redemptions.game_name, sum(redemptions.amount) as sum_amount").where('redemptions.advertiser_name=?',adv_name).group('redemptions.advertiser_name,redemptions.developer_name,redemptions.game_name')
   end
   
   ########
   #by studio
   #########
   
   def self.byGameByStudioName(studio_name="")
    Redemption.select("redemptions.advertiser_name,redemptions.developer_name,redemptions.game_name, sum(redemptions.amount) as sum_amount").where('redemptions.developer_name=?',studio_name).group('redemptions.advertiser_name,redemptions.developer_name,redemptions.game_name')
   end
end
