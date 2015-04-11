class AddFieldsProjects < ActiveRecord::Migration
  def change
    add_column :projects, :revit_file_path, :string
    add_column :projects, :user_id, :integer
  end

end
