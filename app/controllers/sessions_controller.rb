class SessionsController < ApplicationController

    def destroy
      session.clear
      # session.delete(:user_id)
      # session[:user_id] = nil
      redirect_to :root
    end

    def new
      @user = User.new
      # @users = User.all
    end

    def create   #removed 5 @user
      user = User.find_by(name: params[:user][:name])  #|| @user = User.new
      if user && user.authenticate(params[:user][:password])
        session[:user_id] = user.id
        redirect_to user_path(user), notice: "Welcome back to the theme park!"
      else
        # redirect_to new_user_path
        redirect_to :root
      end
    end
  end
