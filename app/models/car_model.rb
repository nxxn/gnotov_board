class CarModel < ApplicationRecord

  has_many :ads
  belongs_to :car_make

end
