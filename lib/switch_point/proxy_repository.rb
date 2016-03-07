require 'singleton'
require 'switch_point/proxy'

module SwitchPoint
  class ProxyRepository
    include Singleton

    def self.checkout(name)
      Rails.logger.error("[SwitchPoint] proxies on checkout: #{instance.proxies}")
      Rails.logger.error("[SwitchPoint] checking out #{name}")
      instance.checkout(name)
    end

    def self.find(name)
      Rails.logger.error("[SwitchPoint] proxies on find: #{instance.proxies}")
      Rails.logger.error("[SwitchPoint] finding out #{name}")
      instance.find(name)
    end

    def checkout(name)
      proxies[name] ||= Proxy.new(name)
    end

    def find(name)
      proxies.fetch(name)
    end

    def proxies
      @proxies ||= {}
    end
  end
end
