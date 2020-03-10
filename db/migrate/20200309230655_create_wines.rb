class CreateWines < ActiveRecord::Migration[6.0]
  def change
    create_table :wines do |t|
      t.string :title
      t.integer :year
      t.string :varietal
      t.string :origin
      t.string :description
      t.integer :score

      t.timestamps
    end
  end
end
