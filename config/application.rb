require File.expand_path('../boot', __FILE__)
require 'rails/all'
Bundler.require(:default, Rails.env) if defined?(Bundler)
module Posint
  class Application < Rails::Application
    config.encoding = "utf-8"
    config.filter_parameters += [:password]
    AWS::S3::Base.establish_connection!(
        :access_key_id     => 'AKIAJP4FUSX4MWQ66VQQ',
        :secret_access_key => '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'
    )
    BUCKET = 'interview.playonsports.com'
  end
end