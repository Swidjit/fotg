class KidsGamesController < ApplicationController

  def index
    @games = OtherGame.where('id in (?)',(23..28))
  end
end
