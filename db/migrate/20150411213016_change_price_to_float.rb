class ChangePriceToFloat < ActiveRecord::Migration
  def up
    change_column :products, :price_per_unit, :float
  end

  def down
    change_column :products, :price_per_unit, :integer
  end
end
