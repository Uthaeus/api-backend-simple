class Comment < ApplicationRecord
  belongs_to :meetup
  belongs_to :user

  validates_presence_of :content, length: { minimum: 3, maximum: 500 }
end
