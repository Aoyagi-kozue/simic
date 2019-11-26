class Tag < ApplicationRecord

  validates :name, presence: true

  has_many :comic_tags
  has_many :comic, through: :comic_tags

end
