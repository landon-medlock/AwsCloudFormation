require 'aws-sdk'

module Devops
	class EC2

		attr_reader :client 

		def initialize(opts={})
			@client = AWS::EC2::Client.new(opts)
		end

		def generate_key_pair(key_name)
			client.create_key_pair(key_name: key_name).key_material
		end
	end
end