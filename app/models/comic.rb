class Comic < ApplicationRecord
  validates :title, :author, :synopsis, presence: true, length: {minimum: 3}
  scope :sorted_by_title, -> {order(:title)}
end
