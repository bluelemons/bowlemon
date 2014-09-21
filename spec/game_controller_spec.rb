require './test.rb'

describe "games controller" do

  it 'should display a form to create a new game' do
    get '/games/new'
    assert last_response.body.must_include "players"
  end

  it 'should display the data from a specific game' do
    game = Game.new("olvap, liza")
    game.save
    get "/games/#{ game.id }"
    assert last_response.body.must_include 'olvap'
    assert last_response.body.must_include 'liza'
  end
end
