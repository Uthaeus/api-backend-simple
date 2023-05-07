class CreateMeetups < ActiveRecord::Migration[7.0]
  def change
    create_table :meetups do |t|
      t.string :title
      t.text :description
      t.string :location
      t.string :time
      t.string :date
      t.string :main_image
      t.string :thumb_image

      t.timestamps
    end
  end
end
