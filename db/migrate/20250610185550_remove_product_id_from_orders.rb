class RemoveProductIdFromOrders < ActiveRecord::Migration[7.1]
  def change
    remove_column :orders, :product_id, :bigint
  end
end
