class AdLightsOption < ApplicationRecord

  belongs_to :ad, inverse_of: :ad_lights_option

end
