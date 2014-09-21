require './test.rb'

describe "games controller" do

  def game
    @game ||= Game.new(player_names: "olvap, liza", line: 1)
  end

  it 'should display a form to create a new game' do
    get '/games/new'
    assert last_response.body.must_include "players"
  end

  it 'should display the data from a specific game' do
    game.save
    get "/games/#{ game.id }"
    assert last_response.body.must_include 'olvap'
    assert last_response.body.must_include 'liza'
  end

  it 'should update the data from a game' do
    game.save
    player = game.current_player
    put "/games/#{ game.id }", { shoot: '4' }
    assert player.points == [4]
  end
end
