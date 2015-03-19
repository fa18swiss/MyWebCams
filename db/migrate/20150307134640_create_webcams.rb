class CreateWebcams < ActiveRecord::Migration
  def change
    create_table :webcams do |t|
      t.string :nom
      t.string :url
      t.float :latitude
      t.float :longitude
      t.integer :orientation
      t.references :user, index: true
      t.references :categories, index: true

      t.timestamps
    end
  end
end
