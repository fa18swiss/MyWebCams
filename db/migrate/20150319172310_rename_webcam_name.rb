class RenameWebcamName < ActiveRecord::Migration
  def change
    rename_column :webcams, :nom, :name
  end
end
