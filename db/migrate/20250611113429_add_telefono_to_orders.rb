class AddTelefonoToOrders < ActiveRecord::Migration[7.1]
  def change
    add_column :orders, :telefono, :string
  end
end
