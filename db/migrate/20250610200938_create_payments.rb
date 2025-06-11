class CreatePayments < ActiveRecord::Migration[7.1]
  def change
    create_table :payments do |t|
      t.references :order, null: false, foreign_key: true
      t.integer :price_cents
      t.string :payment_link
      t.integer :payment_method
      t.integer :status
      t.jsonb :payment_info

      t.timestamps
    end
  end
end
