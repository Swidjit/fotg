class KidsGamesController < ApplicationController

  def index
    @games = OtherGame.where('id in (?)',(20..25))
    puts @games
  end
end
