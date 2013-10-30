require 'spec_helper'

describe 'incron::default' do
  let(:chef_run) { ChefSpec::Runner.new.converge(described_recipe) }

  it 'installs the package' do
    expect(chef_run).to install_package('incron')
  end

  it 'enables the service' do
    expect(chef_run).to enable_service('incrond')
  end

  it 'starts the service' do
    expect(chef_run).to start_service('incrond')
  end

end
