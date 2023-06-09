class MeetupsController < ApplicationController
  before_action :set_meetup, only: %i[ show update destroy ]

  # GET /meetups
  def index
    @meetups = Meetup.all

    render json: @meetups, include: :user
  end

  # GET /meetups/1
  def show
    @user = User.find(@meetup.user_id)
    @comments = @meetup.comments.order(created_at: :desc)
    render json: @meetup, include: [:user, :comments]
    
  end

  # POST /meetups
  def create
    @meetup = Meetup.new(meetup_params)

    if @meetup.save
      render json: @meetup, status: :created, location: @meetup
    else
      render json: @meetup.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /meetups/1
  def update
    if @meetup.update(meetup_params)
      render json: @meetup
    else
      render json: @meetup.errors, status: :unprocessable_entity
    end
  end

  # DELETE /meetups/1
  def destroy
    @meetup.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_meetup
      @meetup = Meetup.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def meetup_params
      params.require(:meetup).permit(:title, :description, :location, :time, :date, :main_image, :thumb_image, :user_id)
    end
end
