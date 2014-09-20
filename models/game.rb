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
    players[turn % players.count]
  end

  def player name
    players.select { |player| name == player.name }.first
  end

  def player_list
    self.players.map { |player| player.name }
  end

  def << pines
    current_player.scores.create(pines: pines, game_id: id)
    check_to_next_turn
  end

  private

  def check_to_next_turn
    self.turn += 1 if current_player.points.count.even?
  end

end
