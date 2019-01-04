class Api::V1::EventsController < ApplicationController
  # before_action :find_event, only: [:show, :update, :destroy]

  # GET /events
  def index
    @events = Event.all
    render json: @events, status: 200
  end

  # GET /events/1
  def show
    find_event
    render json: @event, status: 200
  end

  # POST /events
  # def create
  #   @event = Event.create(event_params)
  #   @event.save
  #   render json: @event, status: 201
  # ---or---
  #   @event = Event.new(event_params)
  #   if @event.save
  #     render json: @event, status: :created, location: @event
  #   else
  #     render json: @event.errors, status: :unprocessable_entity
  #   end
  # end

  def add
    event = Event.find(params[:id])
    user = current_user
    ue = UserEvent.new(user: user, event: event)
    if ue.save
      user.score += 10
      user.save
      render json: {event: event, user: user, status:"worked"}
    else
      # (validate/ensure that user cannot sign up for same event more that once)
      render json: {status: "Not saved", errors: ue.errors.full_messages}
    end
  end

  def remove
    user = current_user
    event = user.events.find(params[:id])
    user.events.delete(event)
    user.score -= 10
    user.save
    render json: {user: user, event: event, user_events: user.events, status:"worked"}
  end
  #
  # def remove
  #   event = Event.find(params[:id])
  #   user = current_user
  #   user.events.delete(event)
  #   # render json: {status:"worked"}
  # end



  # PATCH/PUT /events/1
  def update
    find_event
    # @event.update(event_params)
    # render json: @event, status: 202
  # ---or---
    # if @event.save
    #   render json: @event, status: :accepted
    # else
    #   render json: {errors: @event.errors.full_messages}, status: :unprocessible_entity
    # end
  # ---or---
    if @event.update(event_params)
      render json: @event
    else
      render json: @event.errors, status: :unprocessable_entity
    end
  end

  # DELETE /events/1
  def destroy
    @event.destroy
  end


private
  def event_params
    params.permit(:cause, :style, :location, :date, :time)
  end
  # ---or---
  # Only allow a trusted parameter "white list" through.
  # def event_params
  #   params.require(:event).permit(:title, :location, :date, :time)
  # end

  def find_event
    @event = Event.find(params[:id])
  end
end
# ---or---
# Use callbacks to share common setup or constraints between actions.
# def set_event
#   @event = Event.find(params[:id])
# end
