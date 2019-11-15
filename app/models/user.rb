class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  mount_uploader :prof_image, ProfImageUploader

  has_many :follows
  has_many :mylists
  has_many :reads
  has_many :recommends
  has_many :evaluations
  has_many :reviews, through: :fav_reviews
  has_many :fav_reviews
  has_many :comics, through: :mylists
  has_many :comics, through: :reads
  has_many :comics, through: :recommends
  has_many :comics, through: :evaluations
  has_many :comics, through: :reviews

end