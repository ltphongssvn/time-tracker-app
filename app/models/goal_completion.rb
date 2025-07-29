class GoalCompletion < ApplicationRecord
  belongs_to :goal

  validates :date, presence: true
  validates :achieved, inclusion: { in: [ true, false ] }
end
