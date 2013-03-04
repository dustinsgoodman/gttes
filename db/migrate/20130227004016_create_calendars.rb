class CreateCalendars < ActiveRecord::Migration
  def up
    create_table :calendars do |t|
      t.string   :name
      t.datetime :start_time
      t.datetime :end_time

      t.string   :description
      t.string   :facebook_event
      t.string   :eventbrite
      t.string   :speaker
      t.string   :speaker_twitter_handle
      
      t.timestamps
    end
  end

  def down
    drop_table :calendars
  end
end
