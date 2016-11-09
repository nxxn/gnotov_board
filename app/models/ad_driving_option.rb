class AdDrivingOption < ApplicationRecord

  belongs_to :ad, inverse_of: :ad_driving_option

end
