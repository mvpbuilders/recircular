class AddShippingFieldsToOrders < ActiveRecord::Migration[7.1]
  def change
    add_column :orders, :direccion, :string
    add_column :orders, :envio, :integer
  end
end
