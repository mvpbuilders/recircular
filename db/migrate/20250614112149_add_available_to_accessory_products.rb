class AddAvailableToAccessoryProducts < ActiveRecord::Migration[7.1]
  def change
    add_column :accessory_products, :available, :boolean, default: true
  end
end
