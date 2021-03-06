class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :password_digest
      t.date :dateofbirth
      t.string :email
      t.string :avatar_url
      t.string :city
      t.string :state
      t.string :address
      t.integer :zipcode, :limit => 5

      t.timestamps
    end
  end
end
