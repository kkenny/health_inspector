require "chef/config"

module HealthInspector
  class Context < Struct.new(:repo_path, :config_path)

    attr_accessor :no_color, :quiet_success

    def cookbook_path
      Array( config.cookbook_path )
    end

    def config
      @config ||= configure
    end

    def configure
      begin
        Chef::Config.from_file(config_path)
      rescue LoadError
        Chef::Config.from_file("#{ENV['PWD']}/#{config_path}")
      end
      Chef::Config
    end

    def chef_rest
      @chef_rest ||= Chef::REST.new( config[:chef_server_url], config[:node_name], config[:client_key] )
    end
  end
end
