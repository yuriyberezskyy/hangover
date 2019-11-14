class CreatePartyTimes < ActiveRecord::Migration[6.0]
  def change
    create_table :party_times do |t|
      t.string :date
      t.string :occasion
      t.integer :creator_id
      t.string :time

      t.timestamps
    end
  end
end
