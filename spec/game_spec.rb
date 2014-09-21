require './test.rb'

describe "games" do

  def new_game
    @game ||= Game.new(player_names: "olvap, liza", line: 1)
  end

  def create_game
    new_game.save
    new_game
  end

  def game
    create_game
  end

  it 'game should receive a list of players' do
    assert game.player_list == ["olvap", "liza"]
  end

  it 'game has a current player' do
    assert game.current_player.name = 'olvap'
  end

  it 'game should save the score to the current user' do
    player = game.current_player
    game << 4
    assert player.points == [4]
    game << 5
    assert player.points == [4, 5]
  end

  it 'game should change the current user every 2 times a player plays' do
    player = game.current_player
    game << 4
    game << 5
    assert game.current_player != player
  end

  it 'someone score 10, should change the current user' do
    player = game.current_player
    game << 10
    assert game.current_player != player
  end

end
