require 'rails_helper'

describe 'Event', type: :feature do
  describe 'create event' do
    it 'should not be valid without creator' do
      event = Event.new(title: "Dawg", date: "Fri, 09 Jul 2021")
      expect(event.valid?).to be(false)
    end

    it 'should not be valid without title' do
      event = Event.new(date: "Sat, 10 Jul 2021", creator_id: 3)
      expect(event.valid?).to be(false)
    end

    it 'should not save without date' do
      event = Event.new(title: "The Next Event", creator_id: 3)
      event.save
      expect(event.persisted?).to be(false)
    end
  end
end