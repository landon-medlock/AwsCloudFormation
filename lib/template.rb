require 'tilt'

module Devops
	class Template

		def generate_json(template_file_path, opts={})
			tilted_json = Tilt.new(template_file_path)
			tilted_json.render(self, opts)
		end
	
	end
end