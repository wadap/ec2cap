require 'ec2cap/hosts'
require 'thor'

module Ec2cap

  class CLI < Thor
    option :tag

    desc 'list', 'show tagged hosts'
    def list(tag)
      hosts = Hosts.new
      hosts.tagged_hosts(tag).each do |host|
        puts host
      end
    end

    desc 'line', 'update capistrano config file line'
    def line(tag, role = 'web')
      hosts = Hosts.new
      puts hosts.capnize(role, hosts.tagged_hosts(tag))
    end

    desc 'config', 'print replaced capstrano config'
    def config(tag, role = 'web', from)
      hosts = Hosts.new
      conf  = File.read(from)
      cap   = conf.gsub(/role\s+:#{role}.+/, hosts.capnize(role, hosts.tagged_hosts(tag)))
      puts cap
    end

  end
end
