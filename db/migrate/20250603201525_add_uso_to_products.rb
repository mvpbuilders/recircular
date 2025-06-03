class AddUsoToProducts < ActiveRecord::Migration[7.1]
  def change
    add_column :products, :uso, :string
  end
end
