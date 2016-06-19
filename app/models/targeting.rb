class Targeting < ActiveRecord::Base
  belongs_to :ad, inverse_of: :targetings

  enum gender: [:male, :female, :unkown]

  validate :has_at_least_one_target?

  validates :places,
    allow_blank: true,
    format: {
      with: /\A([a-z]+)(,\s*[a-z]+)*\z/i,
      message: 'Invalid format!'
    }

  validates :gender,
    inclusion: { in: genders.keys }

  def has_at_least_one_target?
    if places.blank? and gender == 'unkown'
      errors.add :base, 'No target specified!'
    end
  end
end
