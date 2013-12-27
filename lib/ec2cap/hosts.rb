require 'aws-sdk'

module Ec2cap

  class AwsEnvNotDefined < StandardError
  end

  class Hosts
    def initialize

      raise AwsEnvNotDefined if ENV['AMAZON_ACCESS_KEY_ID'].nil? || ENV['AMAZON_SECRET_ACCESS_KEY'].nil? || ENV['AMAZON_DEFAULT_REGION'].nil?

      access_key = ENV['AMAZON_ACCESS_KEY_ID']
      secret_key = ENV['AMAZON_SECRET_ACCESS_KEY']
      region     = ENV['AMAZON_DEFAULT_REGION']

      @ec2 = AWS::EC2.new({
                              access_key_id:     access_key,
                              secret_access_key: secret_key,
                              region:            region,
                          })
    end

    def tagged_hosts(tag)
      hosts = []
      @ec2.instances.tagged('Name').tagged_values(tag).each do |instance|
        hosts.push instance.dns_name
      end
      hosts
    end

    def capnize(role, hosts)
      servers = []
      hosts.each do |host|
        servers.push "'#{host}'"
      end
      line = "role :#{role}, #{servers.join(',')}"
    end
  end
end
