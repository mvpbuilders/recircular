class AddOwnerToProducts < ActiveRecord::Migration[7.1]
  def change
    add_column :products, :owner, :string
  end
end
