class Favori < ActiveRecord::Base
  belongs_to :user, :foreign_key => 'id'
  belongs_to :webcam, :foreign_key => 'id'
end
