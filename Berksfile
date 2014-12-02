site :opscode

def company_cookbook(name, version = '>= 0.0.0', options = {})
  cookbook(name, version, {
    git: "git@github.com:company-cookbooks/#{name}.git"
   }.merge(options))
end

cookbook "apache"
