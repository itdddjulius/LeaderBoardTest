class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :initialize_top_scores

    def initialize_top_scores
      @top_scores_game = Game.find(1) #This is where you can place the id to show the top 5 scores for your favorite game
      @top_scores = @top_scores_game.scores.order(points: :desc).limit(5) #for temporary whole score list
    end

    def admin_required
      current_user.is_admin? || redirect_to('/')
    end
end