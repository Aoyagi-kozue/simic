class Review < ApplicationRecord

  acts_as_taggable

  belongs_to :user
  belongs_to :comic

end
