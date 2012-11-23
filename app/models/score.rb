class Score < ActiveRecord::Base
  
  def self.byGame
    Score.select("scores.game_name, sum(scores.score) as sum_score,games.developer_name,games.developer_id ").joins(' INNER JOIN games ON games.game_name = scores.game_name').where('games.game_name = scores.game_name').group('scores.game_name').order('scores.game_name')
  end
  
end
