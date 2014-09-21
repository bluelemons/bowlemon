require './test.rb'

describe "games controller" do

  def game
    @game ||= Game.new(player_names: "olvap, liza", line: 1)
  end

  it 'should display a form to create a new game' do
    get '/games/new'
    assert last_response.body.must_include "players"
  end

  it 'should update the data from a game in a line' do
    game.save
    player = game.current_player
    put "/lines/#{ game.line }", { shoot: '4' }
    assert player.points == [4]
  end

  it 'should return the current game when get a line' do
    game.save
    get "/lines/#{ game.line }"
    assert last_response.body.must_include 'olvap'
    assert last_response.body.must_include 'liza'
  end
end
