require 'spec_helper'

describe 'incron_d' do

  let(:chef_run) { ChefSpec::SoloRunner.new(step_into: ['incron_d']).converge('incron_spec::simple') }

  it 'should render fragment' do
    expect(chef_run).to render_file('/etc/incron.d/notify_home_changes').with_content('/home IN_MODIFY /usr/local/bin/abcd')
  end

  it 'should reload incrond' do
    expect(chef_run.template('/etc/incron.d/notify_home_changes')).to notify('service[incrond]').to(:reload)
  end

  context 'on an el 7 system' do
    let(:chef_run) { ChefSpec::SoloRunner.new(:platform => 'redhat', :version => '7.0', step_into: ['incron_d']).converge('incron_spec::simple') }

    it 'should restart incrond' do
      expect(chef_run.template('/etc/incron.d/notify_home_changes')).to notify('service[incrond]').to(:restart)
    end
  end

end
