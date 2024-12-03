class UserBook < ApplicationRecord
  belongs_to :user
  belongs_to :book
  validates :user_id, :book_id, presence: true
  # validates :pages_read, number: { maximum: self.book.number_of_pages }
  validate :pages_read_validation

  private

  def pages_read_validation
    if pages_read > book.number_of_pages
      errors.add(:pages_read, "wrong page number")
    end
  end
end
