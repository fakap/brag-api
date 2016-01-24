class Brag < ActiveRecord::Base
  belongs_to :user
  mount_uploader :photo, BragUploader

  validates :title, presence: true
  validates :photo, presence: true
end
