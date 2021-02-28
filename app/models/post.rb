class Post < ApplicationRecord
  mount_uploader :img, ImgUploader
  validates :title, presence: true  
  
  belongs_to :user
end
