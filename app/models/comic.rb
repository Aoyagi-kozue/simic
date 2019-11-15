class Comic < ApplicationRecord


  has_many :mylists
  has_many :cover_imgs
  has_many :comic_tags
  has_many :tags, through: :comic_tags
  has_many :reads
  has_many :recommends
  has_many :evaluations
  has_many :reviews

  has_many :users, through: :mylists
  has_many :users, through: :reads
  has_many :users, through: :recommends
  has_many :users, through: :evaluations
  has_many :users, through: :reviews

  # belongs_to :author
  # belongs_to :publisher
  # belongs_to :label
  # belongs_to :genre

  def self.search(search)
    where('title LIKE ?', "%#{search}%")
  end

end
