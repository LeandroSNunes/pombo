require 'pombo/version'
require 'pombo/configuration'
require 'pombo/exception'
require 'pombo/support'
require 'pombo/services'
require 'pombo/package'
require 'pombo/package/item'
require 'pombo/package/format'
require 'pombo/webservice/base'
require 'pombo/webservice/cpp'
require 'pombo/webservice/cpp/service'
require 'pombo/webservice/cpp/response'
require 'pombo/webservice/cpp/base_request'
require 'pombo/webservice/cpp/shipping_request'
require 'pombo/webservice/cpp/shipping_value_request'
require 'pombo/webservice/cpp/delivery_time_request'

module Pombo
  # Inform settings for persisting with default
  # @yield [config] with the configuration data
  # @option config [String]  :contract_code Its administrative code by the ECT
  # @option config [String]  :password Password to access the service, associated with its contract code
  # @option config [Integer] :extends_delivery Days late on a package
  # @option config [Integer] :request_timeout Second delay when accessing the webservice
  # @option config [Symbol]  :log_level Log Level, `:info`, `:debug` or `warn`
  # @option config [Symbol]  :logger object to trigger messages (defaults to `:logger`)
  #
  # @example
  #   Pombo.setup do |config|
  #     config.contract_code = 'AA99BB'
  #     config.password = '999999'
  #     config.extends_delivery = 0
  #     config.request_timeout = 5
  #     config.log_level = :info
  #     config.logger = :logger
  #   end
  def self.setup(&block)
    Configuration.setup(&block)
  end

  # Tells the settings that will be used at this time
  # @note Does not modify the default settings
  # @options (see .setup)
  # @return [Pombo::Configuration] current settings
  def self.set(**args)
    @@configurations = Configuration.new args
  end

  # @return [Pombo::Configuration] current settings
  def self.configurations
    @@configurations ||= Configuration.new
  end

  def self.shipping(package)
    Webservice::CPP.shipping(package)
  end

  def self.delivery_time(package)
    Webservice::CPP.delivery_time(package)
  end

  def self.shipping_value(package)
    Webservice::CPP.shipping_value(package)
  end
end
