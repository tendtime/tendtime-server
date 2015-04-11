class AddFieldsToProducts < ActiveRecord::Migration
  def change
    add_column :products, :title, :text
    add_column :products, :price_per_unit, :integer
    add_column :products, :unit, :text
  end
end
