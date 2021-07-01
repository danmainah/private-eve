class EventAttendeesController < ApplicationController
  def create
    @event = Event.find(params[:event_id])

    users_events = @event.event_attendees.find_by(attendee_id: current_user.id)
    redirect_to event_path(params[:event_id]) and return if users_events

    @event_attended = @event.event_attendees.build(attendee_id: current_user.id)
    redirect_to event_path(params[:event_id]) and return if @event_attended.save

    render body: 'not saved'
  end
end
