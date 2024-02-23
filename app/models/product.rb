class Product < ApplicationRecord
  validates :name, presence: true
  validates :price, presence: true,
  numericality: { less_than_or_equal_to: 10000 }
  validates :status, presence: true
  has_many :approvals
end
