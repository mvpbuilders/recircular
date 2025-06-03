class AddMedidasToProducts < ActiveRecord::Migration[7.1]
  def change
    add_column :products, :medidas, :string
  end
end
