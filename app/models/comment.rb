class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :brag

  validates :text, {
    presence: true
  }
end
