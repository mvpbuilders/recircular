class AddGeneroToProducts < ActiveRecord::Migration[7.1]
  def change
    add_column :products, :genero, :string
  end
end
