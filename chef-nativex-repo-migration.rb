require 'chef'
require 'fileutils'

def loader
  @loader ||= ::Chef::CookbookLoader.new('cookbooks')
end

# Run this from within the chef-nativex repo's root.
community_cookbooks = `find ./cookbooks -maxdepth 1 -mindepth 1 -type d | grep -v "nativex" | cut -c 13-`.split("\n")
community_cookbooks.collect! do |cookbook| 
  puts "Loading #{cookbook.to_s}"
  loader[cookbook.to_s]
end

community_cookbooks.each do |cb|
  puts "Loaded #{cb.name} with version #{cb.version}"
end

community_cookbooks.sort! {|x,y| x.name <=> y.name}

#File.open('Berksfile', 'w') do |file|
#  file.write "source \"https://supermarket.chef.io\"\n"
#  file.write "\n"
#  community_cookbooks.each do |cookbook|
#    file.write "cookbook '#{cookbook.name}', '#{cookbook.version}'\n"
#  end
#end

community_cookbooks.each do |cookbook|
  #FileUtils.rm_rf File.join('cookbooks', cookbook)
  # I waited and ran this part manually.
  puts "git rm -r #{File.join('cookbooks', cookbook.name.to_s)}"
end

# Run 'berks install' on the command line manually when satisfied with the above.
#`bundle exec berks install`