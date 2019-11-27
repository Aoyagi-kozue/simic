class User < ApplicationRecord

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :nickname, presence: true, uniqueness: true, length: {maximum: 20}
  validates :message, length: {maximum: 100}

  mount_uploader :prof_image, ProfImageUploader

  has_many :comic, dependent: :destroy

  has_many :reviews
  has_many :comics, through: :mylists
  has_many :comics, through: :reads
  has_many :comics, through: :recommends
  has_many :comics, through: :evaluations
  has_many :comics, through: :reviews

end