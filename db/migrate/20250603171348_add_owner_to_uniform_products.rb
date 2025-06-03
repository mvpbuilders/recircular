class AddOwnerToUniformProducts < ActiveRecord::Migration[7.1]
  def change
    add_column :uniform_products, :owner, :string
  end
end
