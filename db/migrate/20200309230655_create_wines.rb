class CreateWines < ActiveRecord::Migration[6.0]
  def change
    create_table :wines do |t|
      t.string :title
      t.integer :year
      t.string :varietal
      t.string :description
      t.integer :score
      t.integer :price
      t.string :country
      t.string :region
      t.string :img_url
      t.belongs_to :order
      
      t.timestamps
    end
  end
end
