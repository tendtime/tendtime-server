class CreateRequirements < ActiveRecord::Migration
  def change
    create_table :requirements do |t|
      t.string :type
      t.string :family
      t.string :quantity

      t.timestamps null: false
    end
  end
end
