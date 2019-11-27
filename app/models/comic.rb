class Comic < ApplicationRecord

  acts_as_tagger

  has_many :comic_tags
  has_many :tags, through: :comic_tags
  has_one :review, dependent: :destroy

  belongs_to :user


  def self.search(search)
    if search
      comic = Comic.joins(reviews: :tags)
      .where("(products.title like ?) or (artists.artist_name like ?) or (genres.genre_name like ?) or (record_musics.song_name like ?) or (labels.label_name like ?)", "%#{search}%","%#{search}%","%#{search}%","%#{search}%","%#{search}%")
    end
  end

end
