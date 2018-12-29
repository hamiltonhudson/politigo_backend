class Api::V1::EventsController < ApplicationController

  def index
    @events = Event.all
    render json: @events, status: 200
  end

  def show
    find_event
    render json: @event, status: 200
  end

  # def create
  #   @event = Event.create(event_params)
  #   @event.save
  #   render json: @event, status: 201
  # end

  # def update
  #   @event.update(event_params)
  #   render json: @event, status: 202
  #   -or-
  #   if @event.save
  #     render json: @event, status: :accepted
  #   else
  #     render json: {errors: @event.errors.full_messages}, status: :unprocessible_entity
  #   end
  # end

private
  def event_params
    params.require(:event).permit(:location, :date, :time)
  end

  def find_event
    @event = Event.find(params[:id])
  end
end
