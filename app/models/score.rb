class Score < ActiveRecord::Base
  
  def self.byGame
    Score.select("scores.game_name, sum(scores.score) as sum_score,games.studio_id ").joins(' INNER JOIN games ON games.game_name = scores.game_name').where('games.game_name = scores.game_name').group('scores.game_name').order('scores.game_name')
  end
  
  def self.byUser(id =0)
        Score.select("scores.game_name, sum(scores.score) as sum_score,games.studio_id ").joins(' INNER JOIN games ON games.game_name = scores.game_name').where('games.game_name = scores.game_name').where('scores.user_id=?', id).group('scores.game_name').order('scores.game_name')

  end
end
