class RemoveIdUserFromComments < ActiveRecord::Migration
  def change
    remove_column :comments, :idWebCam, :integer
  end
end
