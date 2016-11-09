class AdSafetyOption < ApplicationRecord

  belongs_to :ad, inverse_of: :ad_safety_option

end
