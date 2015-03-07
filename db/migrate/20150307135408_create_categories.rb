class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :nom
      t.integer :idWebCam
      t.references :webcam, index: true

      t.timestamps
    end
  end
end
