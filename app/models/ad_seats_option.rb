class AdSeatsOption < ApplicationRecord

  belongs_to :ad, inverse_of: :ad_seats_option

end
