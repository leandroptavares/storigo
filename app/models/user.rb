class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable
  has_many :user_books, dependent: :destroy
  has_many :books, through: :user_books
  has_many :reviews, dependent: :destroy
  has_many :user_communities
  has_many :communities, through: :user_communities
  has_many :user_reactions, dependent: :destroy
  has_one_attached :photo
  validates :email, :username, :first_name, :last_name, presence: true
  validates :email, :username, uniqueness: true
  has_many :surveys, dependent: :destroy

  def full_name
    "#{self.first_name} #{self.last_name}"
  end
end
