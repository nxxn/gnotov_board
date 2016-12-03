class DealerInfo < ApplicationRecord
  belongs_to :user, inverse_of: :dealer_info

  has_attached_file :dealer_logo, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"

  validates_attachment_content_type :dealer_logo, content_type: /\Aimage\/.*\z/
end
