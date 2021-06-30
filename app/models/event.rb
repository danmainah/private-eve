class Event < ApplicationRecord
    belongs_to :creator, class_name: 'User'

    has_many :event_attendees, foreign_key: 'event_id'
    has_many :attendees, through: :event_attendees, source: :attendee

    scope :past, -> { where("date < ?", Time.current) }

    scope :future, -> {where("date > ?", Time.current) }
   
end
