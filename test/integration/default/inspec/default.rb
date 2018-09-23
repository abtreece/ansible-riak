control 'install-riak-1.0' do
  impact 0.7
  title 'Ensure riak package is installed'
  desc 'Ensure riak package is installed'

  describe package('riak') do
    it { should be_installed }
  end
end

control 'configure-riak-1.2' do
  impact 0.7
  title 'Ensure riak config files are installed'
  desc 'Ensure riak config files are installed'

  describe file('/etc/riak/riak.conf') do
    its('owner') { should eq 'root' }
    its('group') { should eq 'root' }
    its('mode') { should cmp '0644' }
  end

  describe file('/etc/riak/advanced.config') do
    its('owner') { should eq 'root' }
    its('group') { should eq 'root' }
    its('mode') { should cmp '0644' }
  end

  describe file('/etc/security/limits.d/riak.conf') do
    its('owner') { should eq 'root' }
    its('group') { should eq 'root' }
    its('mode') { should cmp '0644' }
    its('content') { should match(/riak soft nofile 131072/) }
    its('content') { should match(/riak hard nofile 131072/) }
    its('content') { should match(/root soft nofile 131072/) }
    its('content') { should match(/root hard nofile 131072/) }
  end
end

control 'riak-service-1.0' do
  impact 0.7
  title 'Ensure riak service is enabled'
  desc 'Ensure riak service is enabled'

  describe service('riak') do
    it { should be_installed }
    it { should be_enabled }
  end
end

control 'riak-service-1.1' do
  impact 0.7
  title 'Ensure riak service is running'
  desc 'Ensure riak service is running'

  describe service('riak') do
    it { should be_running }
  end
end
