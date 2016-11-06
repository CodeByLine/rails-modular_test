class AttractionsController < ApplicationController
    before_action :set_attraction, only: [:show, :edit, :update, :destroy]

    def index
      @attractions = Attraction.all
    end

    def show
      @attraction = Attraction.find(params[:id])
      @ride = Ride.new
      @user = @current_user
    end

    def new
      # if @user.role > 0
        @attraction = Attraction.new
      # else
      #   "You don't have the privilege to create attractions."
      #   redirect_to user_path
      # end
    end

    def create
      # if @user.admin
        @attraction = Attraction.new(attraction_params)
      # respond_to do |format|
      if @attraction.save     # if @user.admin
        redirect_to attraction_path(@attraction), notice: 'Attraction was created.'
          # format.html { redirect_to @attraction, notice: 'Attraction was successfully created.' }
        else
        #   "Huh?"
          render :new
        end
    end


    def edit
    end

    def update
      # respond_to do |format|
        if @attraction.update(attraction_params)
          redirect_to @attraction, notice: 'Attraction was successfully updated.'
          # format.html { redirect_to @attraction, notice: 'Attraction was successfully updated.' }
        else
          render :edit
          # format.html { render :edit }
        end
    end

    def go_on_ride
      @user = current_user
      ride = Ride.create(user_id: @user.id, attraction_id: params[:id])
      flash[:notice] = ride.take_ride
      redirect_to user_path(@user)
    end

    def destroy
      @attraction.destroy
      redirect_to attractions_url, notice: 'Attraction was successfully destroyed.'
      # respond_to do |format|
        # format.html { redirect_to attractions_url, notice: 'Attraction was successfully destroyed.' }
    end

  private
    def set_attraction
      @attraction = Attraction.find(params[:id])
    end

    def attraction_params
      params.require(:attraction).permit(
        :name,
        :min_height,
        :tickets,
        :happiness_rating,
        :nausea_rating
      )
    end

end
