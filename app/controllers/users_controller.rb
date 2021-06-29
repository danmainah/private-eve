class UsersController < ApplicationController
    def show
      @events_created = current_user.events
    end
end
