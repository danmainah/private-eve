class Event < ApplicationRecord
    belongs_to :creator, class_name: 'User'

    has_many :event_attendees, foreign_key: 'event_id'
    has_many :attendees, through: :event_attendees, source: :attendee

    def self.past
      Event.where("date < ?", Time.current)
    end

    def self.future
      Event.where("date > ?", Time.current)
    end

end
