class Wow < ActiveRecord::Base
  belongs_to :brag
  belongs_to :user
end
