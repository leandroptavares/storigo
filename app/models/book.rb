class Book < ApplicationRecord
  validates :title, :description, :author, :category,
            :number_of_pages, :publish_date, :cover_image, :api_id, presence: true
end
