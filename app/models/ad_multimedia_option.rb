class AdMultimediaOption < ApplicationRecord

  belongs_to :ad, inverse_of: :ad_multimedia_option

end
