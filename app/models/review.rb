class Review < ApplicationRecord

  validates :review_text, presence: true, length: {maximum: 200}
  validates :star, presence: true

  acts_as_taggable

  belongs_to :user
  belongs_to :comic

end
