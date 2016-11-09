class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :ads, dependent: :destroy

  has_many :favorite_ads, dependent: :destroy
  has_many :favorites, through: :favorite_ads, source: :ad

  has_many :ad_issues, dependent: :destroy

  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"

  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  has_attached_file :dealer_logo, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"

  validates_attachment_content_type :dealer_logo, content_type: /\Aimage\/.*\z/
end
