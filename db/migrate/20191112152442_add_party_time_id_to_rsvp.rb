class AddPartyTimeIdToRsvp < ActiveRecord::Migration[6.0]
  def change
    add_column :rsvps, :party_time_id, :integer
  end
end
