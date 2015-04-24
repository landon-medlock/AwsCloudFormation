require_relative 'lib/ec2'
require_relative 'lib/template'
require_relative 'lib/cloudformation'
require 'csv'

template_path = File.expand_path("../templates", __FILE__)


desc "Generate key pair"
task :generate_key, [:key_name] do |_,args|
	key = Devops::EC2.new.generate_key_pair(args.key_name)
	File.open("#{args.key_name}.pem", 'w') { |file| file.write(key) }
end

desc "Generate cloudformation template"
task :generate_template, [:template_file_path, :stack_name, :description] do |_, args|
	template = Devops::Template.new.generate_json(args.template_file_path, {name: args.stack_name, description: args.description})
	File.open("outputs/#{args.stack_name}.json", "w") { |file| file.write(template)  }
end

desc "Validate the template"
task :validate, [:stack_name] do |_,args|
	template = Devops::Template.new.generate_json("#{template_path}/base.json.erb", {name: args.stack_name})
	Devops::CloudFormation.new.validate_template(template)
end

desc "Export credentials"
task :export_creds, [:access_key_id, :secret_access_key] do |_, args| 
	exec("export AWS_ACCESS_KEY_ID=#{args.access_key_id}")
	exec("export AWS_SECRET_ACCESS_KEY=#{args.secret_access_key}")
end