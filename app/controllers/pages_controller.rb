class PagesController < ApplicationController
    def home 
        @meetups = Meetup.all.slice(0, 3)
        render json: @meetups
    end
end