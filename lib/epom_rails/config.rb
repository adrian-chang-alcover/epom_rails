require 'active_support/configurable'

module EpomRails
  # Configures global settings for EpomRails
  #   EpomRails.configure do |config|
  #     config.offline = false
  #   end
  def self.configure(&block)
    yield @config ||= EpomRails::Configuration.new
  end

  # Global settings for EpomRails
  def self.config
    @config
  end

  # need a Class for 3.0
  class Configuration #:nodoc:
    include ActiveSupport::Configurable
    config_accessor :offline, :advertiser, :campaign, :banner, :site, :zone, :placement

    def param_name
      config.param_name.respond_to?(:call) ? config.param_name.call : config.param_name
    end

    # define param_name writer (copied from AS::Configurable)
    writer, line = 'def param_name=(value); config.param_name = value; end', __LINE__
    singleton_class.class_eval writer, __FILE__, line
    class_eval writer, __FILE__, line
  end

  # this is ugly. why can't we pass the default value to config_accessor...?
  EpomRails.configure do |config|
    config.offline = false
    config.advertiser = {}
    config.campaign = {}
    config.banner = {}
    config.site = {}
    config.zone = {}
    config.placement = {}
  end
end
