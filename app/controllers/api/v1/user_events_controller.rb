class Api::V1::UserEventsController < ApplicationController

  def index
    @user_events = UserEvent.all
  end

  def create
    @ue = UserEvent.create(ue_params)
    if @ue.valid?
      @ue.user.increase_score
      @event = Event.find { |event| event.id == @ue.event_id}
      @ue.save
      render json: @ue, status: 201
    else
      render json: {errors: @ue.errors.full_messages}
    end
  end

  def destroy
   @ue = UserEvent.find(params[:id])
   @ue.user.decrease_score
   @user = @ue.user
   @ue.destroy
   render json: @user, status: 201
 end


  private
    def ue_params
      params.require(:user_event).permit(:user_id, :event_id)
    end

end
