require "rubygems"

Bundler.require(:default, "development") if defined?(Bundler)

path = File.expand_path(File.dirname(__FILE__) + "/../../../lib/")
$LOAD_PATH.unshift(path) unless $LOAD_PATH.include?(path)
require path + '/flexmls_api'

module FlexmlsApi
  def self.logger
    if @logger.nil?
      @logger = Logger.new(STDOUT)
      @logger.level = ENV["VERBOSE"].nil? ? Logger::WARN : Logger::DEBUG
    end
    @logger
  end
end

FlexmlsApi.logger.info("Client configured!")

FlexmlsApi.configure do |config|
  config.api_key = ENV["API_KEY"] 
  config.api_secret = ENV["API_SECRET"]
  config.api_user = ENV["API_USER"] if ENV["API_USER"]
  config.endpoint = ENV["API_ENDPOINT"] if ENV["API_ENDPOINT"]
end

include FlexmlsApi::Models
