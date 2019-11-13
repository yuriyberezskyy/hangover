class AddBusinessIdToPartyTime < ActiveRecord::Migration[6.0]
  def change
    add_column :party_times, :business_id, :integer
  end
end
