class AddUserReferenceToMeetups < ActiveRecord::Migration[7.0]
  def change
    add_reference :meetups, :user, foreign_key: true
  end
end
