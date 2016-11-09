class AdSteeringOption < ApplicationRecord

  belongs_to :ad, inverse_of: :ad_steering_option

end
