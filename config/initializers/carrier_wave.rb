if Rails.env.production?
  process :fix_exif_rotation
  CarrierWave.configure do |config|
    config.fog_provider = 'fog/aws'
    config.fog_credentials = {
      # Amazon S3用の設定
      :provider              => 'AWS',
      :region                => ENV['S3_REGION'],
      :aws_access_key_id     => ENV['S3_ACCESS_KEY'],
      :aws_secret_access_key => ENV['S3_SECRET_KEY']
    }
    config.fog_directory     =  ENV['S3_BUCKET']
    config.fog_attributes = { cache_control: "public, max-age=#{365.days.to_i}" }
  end

  # 日本語ファイル名の設定
  CarrierWave::SanitizedFile.sanitize_regexp = /[^[:word:]\.\-\+]/
  # スマホ画像を縦向きにする設定
  module CarrierWave
    module MiniMagick
      def fix_exif_rotation
        manipulate! do |img|
          img.auto_orient
          img = yield(img) if block_given?
          img
        end
      end
    end
  end
end
