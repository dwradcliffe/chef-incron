require 'spec_helper'

describe 'incron_d' do

  let(:chef_run) { ChefSpec::Runner.new(step_into: ['incron_d']).converge('incron_spec::simple') }

  it 'should render fragment' do
    expect(chef_run).to render_file('/etc/incron.d/notify_home_changes').with_content("# Incrontab for notify_home_changes managed by Chef. Changes will be overwritten.\n\n/home IN_MODIFY /usr/local/bin/abcd")
  end

end
