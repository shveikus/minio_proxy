# frozen_string_literal: true

# Module Storage is a service module for datastorage layer.
module MinioProxy
  module Storage
    class MinioConnector
      def call
        mc = Aws::S3::Client.new(
          endpoint: ENV['ENDPOINT'],
          access_key_id: ENV['ACCESS_KEY_ID'],
          secret_access_key: ENV['SECRET_ACCESS_KEY'],
          force_path_style: true,
          region: 'us-east-1'
        )
        begin
          path_key = "#{tool}/#{JSON.parse(event)['webhookEvent']}/"\
                     "year=#{Time.now.year}/month=#{Time.now.month}/" + Time.now.to_s + SecureRandom.hex
          # this raise here cause of require of webhookEvent key in minio storage
          raise JSON::ParserError if JSON.parse(event)['webhookEvent'].nil?
        rescue StandardError
          return 400
        end
        mc.put_object(
          bucket: ENV['BUCKET'],
          body: event,
          key: path_key
        )
        200
      end
    end
  end
end
