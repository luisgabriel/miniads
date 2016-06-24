class Targeting < ActiveRecord::Base
  belongs_to :ad, inverse_of: :targetings

  enum gender: [:male, :female, :unkown]

  validate :has_at_least_one_target?

  validates :places,
    allow_blank: true,
    format: {
      with: /\A([a-z]+)(,\s*[a-z]+)*\z/i,
      message: 'Must use only comma-separated places with alphabetic characters'
    }

  validates :gender,
    inclusion: { in: genders.keys }


  def has_at_least_one_target?
    if places.blank? and gender == 'unkown'
      errors.add :places, 'No target specified'
      errors.add :gender, 'No target specified'
    end
  end
end
