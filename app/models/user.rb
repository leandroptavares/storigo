class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable
  has_many :books
  has_many :reviews, dependent: :destroy
  has_many :user_communities
  has_many :user_books, dependent: :destroy
  has_many :user_reactions, dependent: :destroy
  validates :email, :username, :first_name, :last_name, presence: true
  validates :email, :username, uniqueness: true
end
