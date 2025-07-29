class Category < ApplicationRecord
  belongs_to :user
  belongs_to :parent_category, class_name: 'Category', optional: true
  has_many :subcategories, class_name: 'Category', foreign_key: 'parent_category_id'
  has_many :time_entries, dependent: :destroy
  has_many :goals

  validates :name, presence: true
end
