class SessionsController < ApplicationController

    def new 
        @user = User.new
        # binding.pry
    end

    def create
      @user = User.find_by(username: params[:username])
      binding.pry
      if @user && @user.authenticate(params[:password])
        session[:user_id] = @user.id 
        binding.pry
        redirect_to games_path
      else 
        @error = "Please make sure all fields are filled in and valid."
        render :new 
      end
    end

    def delete
      session.clear
      redirect_to login_path
    end
end