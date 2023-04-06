class Comic < ApplicationRecord
  validates :title, presence: true, length: {minimum: 3}
  scope :sorted_by_title, -> {order(:title)}

  belongs_to :author
end
