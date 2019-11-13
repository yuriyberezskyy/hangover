class CreateBusinesses < ActiveRecord::Migration[6.0]
  def change
    create_table :businesses do |t|
      t.string :name
      t.string :location
      t.string :rating
      t.string :img_url
      t.string :url
      t.string :category
      t.string :area

      t.timestamps 
    end
  end
end
