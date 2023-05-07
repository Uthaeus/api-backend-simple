class Meetup < ApplicationRecord

    validates_presence_of :title, :description, :location, :date, :time

    mount_uploader :main_image, MeetupUploader
    mount_uploader :thumb_image, MeetupUploader

    belongs_to :user
end
