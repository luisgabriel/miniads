class Ad < ActiveRecord::Base
  has_many :creatives, inverse_of: :ad

  validates :budget,
    presence: true,
    numericality: { greater_than: 0 }

  validates :creatives,
    presence: true

  accepts_nested_attributes_for :creatives
end
