class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.text :requirements
      t.string :name
      t.string :description

      t.timestamps null: false
    end
  end
end
