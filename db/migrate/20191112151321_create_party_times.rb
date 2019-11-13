class CreatePartyTimes < ActiveRecord::Migration[6.0]
  def change
    create_table :party_times do |t|
      t.string :date
      t.string :occasion

      t.timestamps
    end
  end
end
