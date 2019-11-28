class Review < ApplicationRecord

  validates :review_text, presence: true
  validates :star, presence: true

  acts_as_taggable

  belongs_to :user
  belongs_to :comic

end
