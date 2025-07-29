class User < ApplicationRecord
  has_many :categories, dependent: :destroy
  has_many :time_entries, dependent: :destroy
  has_many :goals, dependent: :destroy

  validates :email, presence: true, uniqueness: true
  validates :encrypted_password, presence: true
end
