class Game
  include DataMapper::Resource
  property :id, Serial
  property :turn, Integer
  #property :body, Text
  #property :created_at, DateTime

  has n, :scores
  has n, :players, model: 'Player', child_key: [:id], parent_key: [:player_id], :through => :scores

  def initialize *args
    self.turn = 0
    self.players = args.map{ |name| Player.new name: name }
  end

  def current_player
    players[turn]
  end

  def player name
    players.select { |player| name == player.name }
  end

  def player_list
    self.players.map { |player| player.name }
  end

end

# Perform basic sanity checks and initialize all relationships
# Call this when you've defined all your models
