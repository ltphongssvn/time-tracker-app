class Goal < ApplicationRecord
  belongs_to :user
  belongs_to :category, optional: true
  has_many :goal_completions, dependent: :destroy

  validates :goal_type, presence: true, inclusion: { in: %w[daily weekly specific_hour] }
  validates :target_minutes, presence: true, numericality: { greater_than: 0 }
end
