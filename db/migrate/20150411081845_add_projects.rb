class AddProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.string :description
      t.string :revit_file_path
      t.integer :user_id
    end
  end

end
