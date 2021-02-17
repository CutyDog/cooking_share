class Post < ApplicationRecord
  mount_uploader :img, ImgUploader
end
