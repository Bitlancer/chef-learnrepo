# # encoding: utf-8

# Inspec test for recipe learnrepo::default

# The Inspec reference, with examples and extensive documentation, can be
# found at https://docs.chef.io/inspec_reference.html

# negative pulse check
describe command('ping google.com') do
  its('exit_status') { should_not eq 0 }
  its('stderr') { should eq "ping: google.com: Name or service not known\n" }
end

%w(base extras updates epel).each do |repo|
  describe yum.repo(repo) do
    it { should exist }
    it { should_not be_enabled }
  end
end

describe yum.repo('learnrepo') do
  it { should exist }
  it { should be_enabled }
end

%w(httpd redis mariadb-server ruby ruby-devel mariadb-devel libarchive-devel gcc).each do |pkg|
  describe package(pkg) do
    it { should be_installed }
  end
end

describe command('yum update') do
  its('exit_status') { should eq 0 }
end
