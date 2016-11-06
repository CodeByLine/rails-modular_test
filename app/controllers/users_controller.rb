class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def show
    if session[:user_id]
       @user = User.find(params[:id])
       @message = params[:message] if params[:message]
       @message ||= false
    else
       redirect_to root_path
    end
  end

  # def show
  #   if session[:user_id]
  #     @user = User.find(params[:id])
  #   else
  #     redirect_to root_path
  #   end
  # end

  def new
    @user = User.new
  end

  def create   #removed 4 @user from this block-no impact
    user = User.new(user_params)
    # respond_to do |format|
      if user.save
        session[:user_id] = user.id
        redirect_to user_path(user), notice: 'Welcome to the theme park!'
      else
        render :new
      end

  end


  def edit
  end

  def update
    # respond_to do |format|
      if @user.update(user_params)
        redirect_to @user, notice: 'User was successfully updated.'
        # format.html { redirect_to @user, notice: 'User was successfully updated.' }
      else
        render :edit
        # format.html { render :edit }
      end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(
        :name,
        :id,
        :password,
        :height,
        :tickets,
        :happiness,
        :nausea,
        :admin
      )
    end
end
