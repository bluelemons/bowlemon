class Game
  include DataMapper::Resource
  property :id, Serial
  property :turn, Integer
  property :line, Integer

  has n, :scores
  has n, :players, model: 'Player', child_key: [:id], parent_key: [:player_id], :through => :scores

  def initialize args
    self.turn = 0
    self.players = args[:player_names].split(',').map{ |name| Player.new name: name.strip }
    self.line = args[:line]
  end

  def current_player
    players[turn % players.size]
  end

  def player name
    players.select { |player| name == player.name }.first
  end

  def player_list
    self.players.map { |player| player.name }
  end

  def << pines
    current_player.scores.create(pines: pines, game_id: id)
    check_to_next_turn pines
  end

  private

  def check_to_next_turn pines
    if pines == 10 || current_player.points.count.even?
      self.turn = turn + 1
      save
    end
  end

end
