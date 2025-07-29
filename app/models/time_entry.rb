class TimeEntry < ApplicationRecord
  belongs_to :user
  belongs_to :category

  validates :date, presence: true
  validates :hour, presence: true, inclusion: { in: 0..23 }
  validates :duration_minutes, presence: true, numericality: { greater_than: 0, less_than_or_equal_to: 60 }
end
