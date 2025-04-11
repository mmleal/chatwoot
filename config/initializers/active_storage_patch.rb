Rails.application.config.after_initialize do
  if ActiveStorage::Blob.service.name == :s3_compatible
    ActiveStorage::Blob.class_eval do
      def service_url(**options)
        "#{ENV['STORAGE_ENDPOINT']}/#{ENV['STORAGE_BUCKET_NAME']}/#{key}"
      end
    end
  end
end
