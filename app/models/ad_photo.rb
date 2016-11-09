class AdPhoto < ApplicationRecord

  belongs_to :ad, inverse_of: :ad_photos

  has_attached_file :image,
    styles: { medium: "1168x400#", thumb: "300x200>" }, default_url: "/images/:style/missing.png"

  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

end
