class User < ApplicationRecord
  has_many :categories, dependent: :destroy
  has_many :transaction_details, through: :categories

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :rememberable, :validatable

  validates :name, presence: true
end
