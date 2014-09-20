require './test.rb'

describe "games" do

  def game
    Game.new("olvap", "liza")
  end

  it 'game should receive a list of players' do
    assert game.player_list == ["olvap", "liza"]
  end

  it 'game has a current player' do
    assert game.current_player.name = 'olvap'
  end

end
