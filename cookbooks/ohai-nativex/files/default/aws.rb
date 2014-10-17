Ohai.plugin(:AwsRegion) do
  provides "aws"
  depends "ec2"

  def collect_region
    aws Mash.new
    aws[:region] = ec2[:placement_availability_zone].gsub(/[a-z]$/,'') 
  end

  collect_data do
    aws collect_region[:region]
  end
end
