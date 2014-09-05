#!/opt/chef/embedded/bin/ruby
 
require 'socket'
 
# AWS API Credentials
AWS_ACCESS_KEY_ID     = "AKIAJIJCVSBKHUDWUIJQ"
AWS_SECRET_ACCESS_KEY = "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"
 
# Node details
NODE_NAME         = "DAW2AVM-TEST-01"
CHEF_ENVIRONMENT  = "dev"
INSTANCE_SIZE     = "m3.medium"
REGION            = "us-west-2"
AVAILABILITY_ZONE = "us-west-2a"
AMI_NAME          = "ami-d75412e7"
SECURITY_GROUP    = "default"
RUN_LIST          = "recipe[aws],recipe[windows],recipe[nativex-dnsupdate]"
USERNAME          = "Administrator"
PASSWORD          = "zv-Pxohm%N"
 
# Define the command to provision the instance
provision_cmd = [
  "knife ec2 server create",
  "--aws-access-key-id #{AWS_ACCESS_KEY_ID}",
  "--aws-secret-access-key #{AWS_SECRET_ACCESS_KEY}",
  "--tags 'Name=#{NODE_NAME}'",
  "--environment '#{CHEF_ENVIRONMENT}'",
  "--flavor #{INSTANCE_SIZE}",
  "--region #{REGION}",
  "--availability-zone #{AVAILABILITY_ZONE}",
  "--image #{AMI_NAME}",
  "--groups '#{SECURITY_GROUP}'",
  "--verbose"
].join(" ")
 
# Run `knife ec2 server create` to provision the new instance and
# read the output until we know it's public IP address. At that point,
# knife is going to wait until the instance responds on the SSH port. Of
# course, being Windows, this will never happen, so we need to go ahead and
# kill knife and then proceed with the rest of this script to wait until
# WinRM is up and we can bootstrap the node with Chef over WinRM.
ip_addr = nil
IO.popen(provision_cmd) do |pipe|
  begin
    while line = pipe.readline
      puts line
      if line =~ /^Public IP Address: (.*)$/
        ip_addr = $1.strip
        Process.kill("TERM", pipe.pid)
        break
      end
    end
  rescue EOFError
    # done
  end
end
if ip_addr.nil?
  puts "ERROR: Unable to get new instance's IP address"
  exit -1
end
 
# Now the new instance is provisioned, but we have no idea when it will
# be ready to go. The first thing we'll do is wait until the WinRM port
# responds to connections.
puts "Waiting for WinRM..."
start_time = Time.now
begin
  s = TCPSocket.new ip_addr, 5985
rescue Errno::ETIMEDOUT => e
  puts "Still waiting..."
  retry
end
s.close
 
# You'd think we'd be good to go now...but NOPE! There is still more Windows
# bootstrap crap going on, and we have no idea what we need to wait on. So,
# in a last-ditch effort to make this all work, we've seen that 120 seconds
# ought to be enough...
wait_time = 120
while wait_time > 0
  puts "Better wait #{wait_time} more seconds..."
  sleep 1
  wait_time -= 1
end
puts "Finally ready to try bootstrapping instance..."
 
# Define the command to bootstrap the already-provisioned instance with Chef
bootstrap_cmd = [
  "knife bootstrap windows winrm #{ip_addr}",
  "-x #{USERNAME}",
  "-P '#{PASSWORD}'",
  "--environment #{CHEF_ENVIRONMENT}",
  "--node-name #{NODE_NAME}",
  "--run-list #{RUN_LIST}",
  "--verbose"
].join(' ')
 
# Now we can bootstrap the instance with Chef and the configured run list.
status = system(bootstrap_cmd) ? 0 : -1
exit status
