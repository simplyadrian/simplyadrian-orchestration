Ohai.plugin(:aws) do
  provides "aws"
  depends "ec2"
  collect_data(:default) do
    aws Mash.new
    aws[:region] = ec2[:placement_availability_zone].gsub(/[a-z]$/, '')
    :region => aws[:region]
  end
end
