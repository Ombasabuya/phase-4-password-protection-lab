class ApplicationController < ActionController::API
  include ActionController::Cookies
  private

  def require_login
    unless session[:user_id]
      render json: { error: "You must be logged in to access this page." }, status: 401
    end
  end
end
