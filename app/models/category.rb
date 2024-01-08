class Category < ApplicationRecord
  belongs_to :user
  has_many :category_transaction_details
  has_many :transaction_details, through: :category_transaction_details

  validates :user_id, presence: true
  validates :name, presence: true, length: { maximum: 50 }
  validates :icon, presence: true

  def total_amount_spent
    transaction_details.sum(:amount)
  end
end
