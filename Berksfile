# Example parent berksfile
source 'https://supermarket.getchef.com'

organization = 'jhauf-nativex'
repo_prefix = 'chef-'
private_cookbooks = [
    ['cron', '>= 1.6.1', :branch => 'master'],
    ['vim', '>= 1.1.3', :branch => 'master']
]

private_cookbooks.each { |cb|
  cookbook(cb[0], cb[1], {
    git: "git@github.com:#{organization}/#{repo_prefix}#{cb[0]}.git"
  }.merge(cb[2]))
}