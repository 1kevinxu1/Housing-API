class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.string  "street", null: false
      t.string  "status", default: "pending", null: false
      t.integer "price", null: false, index: true
      t.integer "bedrooms", null: false, index: true
      t.integer "bathrooms", null: false, index: true
      t.integer "sq_ft", null: false
      t.decimal "lat", null: false
      t.decimal "lng", null: false
    end
  end
end
