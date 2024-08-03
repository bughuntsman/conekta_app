class CreateOrders < ActiveRecord::Migration[7.1]
  def change
    create_table :orders do |t|
      t.string :status
      t.integer :amount
      t.integer :charge_id
      t.string :payment_link

      t.timestamps
    end
  end
end