class EventAttendeesController < ApplicationController
  def create
    @event = Event.find(params[:event_id])
    @event_attended = @event.event_attendees.build(attendee_id: current_user.id)
    if @event_attended.save
      redirect_to event_path(params[:event_id])
    else
      render body: 'not saved'
    end
  end
end
