class Favori < ActiveRecord::Base
  belongs_to :user
  belongs_to :webcam
end
