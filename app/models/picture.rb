class Picture < ActiveRecord::Base
  
  belongs_to :album
  belongs_to :user
  mount_uploader :file, PictureUploader

  def picture_url
    self.file_url.gsub(/.*public/,'')
  end
end
