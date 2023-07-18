require 'cloudinary'

Cloudinary.config_from_url("cloudinary://824336462488539:pEGHRdxPduNoMq8eWAu3c361h7E@atefcloud")
Cloudinary.config do |config|
  config.secure = true
end