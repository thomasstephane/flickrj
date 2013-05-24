class PictureUploader < CarrierWave::Uploader::Base
  storage :file

  def store_dir
    "#{APP_ROOT}/public/images/uploads"
  end
end