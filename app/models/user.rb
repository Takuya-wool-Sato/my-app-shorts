class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :setting, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :categories, dependent: :destroy
end
