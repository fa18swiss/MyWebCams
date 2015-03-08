class Webcam < ActiveRecord::Base
  belongs_to :user
<<<<<<< HEAD
  belongs_to :categorie
  has_many :comments, depend: :destroy
  has_many :user, through: :comments
=======
  has_many :comments, dependent: :destroy
  has_many :user, through: :comments
  has_many :categories, dependent: :destroy
>>>>>>> 1fce4a1390edbd96d4531cbe3baddf02b7492a1e
end
