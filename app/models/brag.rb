class Brag < ActiveRecord::Base
  belongs_to :user
  has_many :wows, dependent: :destroy
  has_many :comments, dependent: :destroy
  mount_uploader :photo, BragUploader

  validates :title, {
    presence: true
  }
  validates :photo, {
    presence: true
  }
end
