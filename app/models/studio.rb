class Studio < ActiveRecord::Base
  
  
  has_many :games
  
  def self.getStudios
    Studio.select("studios.name as studio_name,studios.id")
  end
  
  def self.getSingleStudioNameById(id)
    Studio.select("studios.name as studio_name").where(studios.id = id)
  end
  
  
end
