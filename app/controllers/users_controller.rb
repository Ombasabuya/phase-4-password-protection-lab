class UsersController < ApplicationController
    def create
      user = User.new(user_params)
      if user.save
        session[:user_id] = user.id
        render json: user
      else
        render json: { error: "Unable to create user." }, status: 400
      end
    end
  
    private
  
    def user_params
      params.require(:user).permit(:username, :password)
    end
    def show
        user = User.find_by(id: session[:user_id])
        if user
          render json: user
        else
          render json: { error: "User not found." }, status: 404
        end
      end
    
  end
  