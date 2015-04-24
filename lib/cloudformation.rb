module Devops
	class CloudFormation
	
		attr_reader :client

		def initialize(opts={})
			@client = AWS::CloudFormation::Client.new(opts)
		end

		def create_stack(stack_name, template_body)
			client.create_stack(
				stack_name: stack_name,
				template_body: template_body)
		end

		def validate_template(template_body)
			client.validate_template(template_body: template_body)
		end

	end
end