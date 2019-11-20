class Comic < ApplicationRecord

  acts_as_tagger

  has_many :mylists
  has_many :comic_tags
  has_many :tags, through: :comic_tags
  has_many :reads
  has_many :recommends
  has_many :evaluations
  has_one :review, dependent: :destroy

  has_many :users, through: :mylists
  has_many :users, through: :reads
  has_many :users, through: :recommends
  has_many :users, through: :evaluations
  has_many :users, through: :reviews

  belongs_to :user


  def self.search(search)
    if search
      comic = Comic.joins(reviews: :tags)
      .where("(products.title like ?) or (artists.artist_name like ?) or (genres.genre_name like ?) or (record_musics.song_name like ?) or (labels.label_name like ?)", "%#{search}%","%#{search}%","%#{search}%","%#{search}%","%#{search}%")
    end
  end

end
