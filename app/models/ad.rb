class Ad < ActiveRecord::Base
  validates :budget, presence: true, :numericality => { :greater_than => 0 }
end
