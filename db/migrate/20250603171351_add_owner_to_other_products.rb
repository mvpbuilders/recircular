class AddOwnerToOtherProducts < ActiveRecord::Migration[7.1]
  def change
    add_column :other_products, :owner, :string
  end
end
