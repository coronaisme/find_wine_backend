class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.string :status
      t.integer :user_id
      t.date :order_date
      t.string :shipped_to
      t.integer :total, default: 0

      t.timestamps
    end
  end
end
