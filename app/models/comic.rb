class Comic < ApplicationRecord

  # mount_uploader :cover_img, CoverImageUploader

  has_many :mylists
  has_many :comic_tags
  has_many :tags, through: :comic_tags
  has_many :reads
  has_many :recommends
  has_many :evaluations
  has_many :reviews, dependent: :destroy

  has_many :users, through: :mylists
  has_many :users, through: :reads
  has_many :users, through: :recommends
  has_many :users, through: :evaluations
  has_many :users, through: :reviews

  belongs_to :user


  def self.search(search)
    where('title LIKE ?', "%#{search}%")
  end

end
