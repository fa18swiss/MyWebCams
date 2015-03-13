class CreateFavoris < ActiveRecord::Migration
  def change
    create_table :favoris do |t|
      t.string :ordre
      t.references :user, index: true
      t.references :webcam, index: true

      t.timestamps
    end
  end
end
