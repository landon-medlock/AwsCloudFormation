require 'spec_helper'

describe 'Template' do

	let(:template) { Devops::Template.new } 

	it 'should put variables in json templates' do 
		generated_json = template.generate_json('templates/vpc/vpc_template.json.erb', {name: 'Something Not On The Original'})
		expect(generated_json).to include 'Something Not On The Original'
	end
end