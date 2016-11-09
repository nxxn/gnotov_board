class AdComfortOption < ApplicationRecord

  belongs_to :ad, inverse_of: :ad_comfort_option

end
