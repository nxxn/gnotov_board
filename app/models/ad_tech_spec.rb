class AdTechSpec < ApplicationRecord

  belongs_to :ad, inverse_of: :ad_tech_spec

  def self.options_for_select
    order('LOWER(engine_type)').map { |e| [e.engine_type, e.id] }
  end

end
