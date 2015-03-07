class CreateWebcams < ActiveRecord::Migration
  def change
    create_table :webcams do |t|
      t.string :nom
      t.string :url
      t.float :latitude
      t.float :longitude
      t.float :orientation
      t.integer :idUser
      t.references :user, index: true

      t.timestamps
    end
  end
end
