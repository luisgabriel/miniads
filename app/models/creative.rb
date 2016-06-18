class Creative < ActiveRecord::Base
  belongs_to :ad, inverse_of: :creatives

  validates :bid,
    presence: true,
    numericality: {
      greater_than: 0,
      less_than_or_equal_to: lambda { |creative| creative.ad.budget }
    }

  validates :ad_text,
    presence: true
end
