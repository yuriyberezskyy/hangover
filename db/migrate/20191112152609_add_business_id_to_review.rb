class AddBusinessIdToReview < ActiveRecord::Migration[6.0]
  def change
    add_column :reviews, :business_id, :integer
  end
end
