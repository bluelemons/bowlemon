class Score
  include DataMapper::Resource
  property :id, Serial
  property :pines, Integer

  belongs_to :player, :model => 'Player', :child_key => [:player_id]
  belongs_to :game,   :model => 'Game',   :child_key => [:game_id]
end
