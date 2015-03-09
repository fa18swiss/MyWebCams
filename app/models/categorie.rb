class Categorie < ActiveRecord::Base
  has_many :webcams, dependent: :destroy
end
