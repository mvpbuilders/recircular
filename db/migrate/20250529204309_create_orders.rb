class CreateOrders < ActiveRecord::Migration[7.1]
  def change
    create_table :orders do |t|
      t.string :email
      t.integer :quantity
      t.decimal :total_amount
      t.string :status
      t.references :product, null: false, foreign_key: true

      t.timestamps
    end
  end
end
