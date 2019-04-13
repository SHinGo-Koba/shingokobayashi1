if Rails.env.production?
  CarrierWave.configure do |config|
    config.cache_dir = "#{Rails.root}/tmp/uploads"
  end
else
  CarrierWave.configure do |config|
    config.cache_dir = "uploads/#{Rails.env}/tmp"
  end
  if Rails.env.test?
    CarrierWave.configure do |config|
     config.enable_processing = false 
    end
  end
end