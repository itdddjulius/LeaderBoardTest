class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :initialize_top_scores

    def initialize_top_scores
      @top_scores = Score.order(points: :desc).limit(5) #for temporary whole score list
    end

    def admin_required
      current_user.is_admin? || redirect_to('/')
    end
end