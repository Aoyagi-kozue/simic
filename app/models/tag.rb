class Tag < ApplicationRecord

  has_many :comic_tags
  has_many :comic, through: :comic_tags

end
