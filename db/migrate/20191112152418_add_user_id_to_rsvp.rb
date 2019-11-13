class AddUserIdToRsvp < ActiveRecord::Migration[6.0]
  def change
    add_column :rsvps, :user_id, :integer
  end
end
