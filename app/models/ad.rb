class Ad < ApplicationRecord

  filterrific(
    available_filters: [
      :sorted_by,
      :with_engine_type,
      :with_gearbox_type,
      :with_body_type,
      :with_color,
      :engine_min,
      :engine_max,
      :year_min,
      :year_max,
      :price_min,
      :price_max
    ]
  )

  scope :with_engine_type, lambda { |engine|
    where( ad_tech_specs: { engine_type: engine }).joins(:ad_tech_spec)
  }

  scope :with_gearbox_type, lambda { |gearbox_type|
    where( ad_tech_specs: { gearbox: gearbox_type }).joins(:ad_tech_spec)
  }

  scope :with_body_type, lambda { |body_select|
    where( ad_tech_specs: { body_type: body_select }).joins(:ad_tech_spec)
  }

  scope :with_color, lambda { |color_select|
    where( ad_tech_specs: { color: color_select }).joins(:ad_tech_spec)
  }

  scope :engine_min, lambda { |engine_cc_min|
    where( 'engine_cc >= ?', engine_cc_min.to_f ).joins(:ad_tech_spec)
  }

  scope :engine_max, lambda { |engine_cc_max|
    where( 'engine_cc <= ?', engine_cc_max.to_f ).joins(:ad_tech_spec)
  }

  scope :year_min, lambda { |built_year_min|
    where( 'built_year >= ?', built_year_min.to_i ).joins(:ad_tech_spec)
  }

  scope :year_max, lambda { |built_year_max|
    where( 'built_year <= ?', built_year_max.to_i ).joins(:ad_tech_spec)
  }

  scope :price_min, lambda { |price_min_select|
    where( 'price >= ?', price_min_select.to_i )
  }

  scope :price_max, lambda { |price_max_select|
    where( 'price <= ?', price_max_select.to_i )
  }

  scope :published, -> { where(active: true, paid: true) }
  scope :paid_not_active, -> { where(active: false, paid: true) }

  belongs_to :user
  belongs_to :car_make
  belongs_to :car_model
  has_many :ad_photos, inverse_of: :ad, dependent: :destroy

  has_one :ad_seats_option, dependent: :destroy
  has_one :ad_driving_option, dependent: :destroy
  has_one :ad_multimedia_option, dependent: :destroy
  has_one :ad_safety_option, dependent: :destroy
  has_one :ad_comfort_option, dependent: :destroy
  has_one :ad_lights_option, dependent: :destroy
  has_one :ad_steering_option, dependent: :destroy
  has_one :ad_tech_spec, dependent: :destroy

  has_many :favorite_ads, dependent: :destroy
  has_many :favorited_by, through: :favorite_ads, source: :user

  has_many :ad_issues, dependent: :destroy

  accepts_nested_attributes_for :ad_photos, allow_destroy: true

  accepts_nested_attributes_for :ad_seats_option, allow_destroy: true
  accepts_nested_attributes_for :ad_driving_option, allow_destroy: true
  accepts_nested_attributes_for :ad_multimedia_option, allow_destroy: true
  accepts_nested_attributes_for :ad_safety_option, allow_destroy: true
  accepts_nested_attributes_for :ad_comfort_option, allow_destroy: true
  accepts_nested_attributes_for :ad_lights_option, allow_destroy: true
  accepts_nested_attributes_for :ad_steering_option, allow_destroy: true
  accepts_nested_attributes_for :ad_tech_spec, allow_destroy: true

  accepts_nested_attributes_for :car_make, allow_destroy: true
  accepts_nested_attributes_for :car_model, allow_destroy: true

  def country_name
    country_name_translated = ISO3166::Country[country]
    country_name_translated.translations[I18n.locale.to_s] || country.name
  end

  self.per_page = 10

end
