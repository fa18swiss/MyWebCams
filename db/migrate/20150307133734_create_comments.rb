class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :content
      t.integer :idWebCam
      t.references :user, index: true
      t.references :webcam, index: true

      t.timestamps
    end
  end
end
