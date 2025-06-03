class AddOwnerToKidsProducts < ActiveRecord::Migration[7.1]
  def change
    add_column :kids_products, :owner, :string
  end
end
