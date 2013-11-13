require 'spec_helper'

describe 'incron::default' do
  let(:chef_run) { ChefSpec::Runner.new.converge(described_recipe) }

  it 'installs the package' do
    expect(chef_run).to install_package('incron')
  end

  context 'in a redhat-based platform' do
    let(:chef_run) { ChefSpec::Runner.new(:platform => 'redhat', :version  => '6.3').converge(described_recipe) }

    before do
      stub_command(/rpm -qa | grep -q '^rpmforge-release-[0-9\.-]'/).and_return(true)
    end

    it 'includes the yum::repoforge recipe' do
      expect(chef_run).to include_recipe('yum::repoforge')
    end

  end

  it 'enables the service' do
    expect(chef_run).to enable_service('incrond')
  end

  it 'starts the service' do
    expect(chef_run).to start_service('incrond')
  end

end
