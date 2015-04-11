class AddExtraFieldsToProducts < ActiveRecord::Migration
  def change
    add_column :products, :family, :string
    add_column :products, :brand, :string
    add_column :products, :supplier_id, :integer
    add_index :products, :supplier_id
  end
end
