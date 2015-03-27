class SetFavoriteOrderNotNull < ActiveRecord::Migration
  def change
    change_column :favoris, :ordre, :integer, :null => false
  end
end
