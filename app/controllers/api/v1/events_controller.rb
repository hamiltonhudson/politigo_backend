class Api::V1::EventsController < ApplicationController
  # before_action :set_event, only: [:show, :update, :destroy]

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

  # PATCH/PUT /events/1
  # def update
  #   @event.update(event_params)
  #   render json: @event, status: 202
  # ---or---
  #   if @event.save
  #     render json: @event, status: :accepted
  #   else
  #     render json: {errors: @event.errors.full_messages}, status: :unprocessible_entity
  #   end
  # ---or---
  #   if @event.update(event_params)
  #     render json: @event
  #   else
  #     render json: @event.errors, status: :unprocessable_entity
  #   end
  # end

  # DELETE /events/1
  # def destroy
  #   @event.destroy
  # end


private
  def event_params
    params.require(:event).permit(:cause, :location)
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
