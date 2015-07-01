class KidsGamesController < ApplicationController

  def index
    @games = OtherGame.where('id in (?)',(98..103))
    puts @games
  end
end
