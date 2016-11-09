class CarMake < ApplicationRecord

  has_many :car_models, dependent: :destroy
  has_many :ads

  accepts_nested_attributes_for :car_models, allow_destroy: true

end
