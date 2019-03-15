class Api::V1::EventsController < ApplicationController

  def index
    @events = Event.all
    render json: @events, status: 200
  end

  def show
    find_event
    render json: @event, status: 200
  end

  def destroy
    @event.destroy
  end


private
  def event_params
    params.permit(:cause, :style, :location, :date, :time, :users)
  end

  def find_event
    @event = Event.find(params[:id])
  end

end
