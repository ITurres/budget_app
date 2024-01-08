class TransactionDetail < ApplicationRecord
  belongs_to :user
  has_many :category_transaction_details
  has_many :categories, through: :category_transaction_details

  validates :user_id, presence: true
  validates :name, presence: true
  validates :amount, presence: true, numericality: { greater_than: 0 }
end
