class OtherGamesController < ApplicationController
  respond_to :html
  before_filter :load_resource_from_id, :except => [:index]

  def show
    puts params[:game]
  end

  private

  def load_resource_from_id
    @game = OtherGame.friendly.find(params[:game])
    @comments = @game.comment_threads.order('created_at desc')
    if user_signed_in?
      @new_comment = Comment.build_from(@game, current_user.id, "")
    end
  end

end
