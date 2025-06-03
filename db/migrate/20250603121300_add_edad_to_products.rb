class AddEdadToProducts < ActiveRecord::Migration[7.1]
  def change
    add_column :products, :edad, :string
  end
end
