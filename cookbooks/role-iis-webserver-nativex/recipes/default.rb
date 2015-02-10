#
# Cookbook Name:: role-iis-webserver-nativex
# Recipe:: default
#
# Copyright 2015, NativeX
#
# All rights reserved - Do Not Redistribute
#

creds = Chef::EncryptedDataBagItem.load('credentials', 'iis_app_pool_creds')

node.default['iis-nativex']['features'] = ["IIS-HttpLogging","IIS-CustomLogging","IIS-LoggingLibraries","IIS-ODBCLogging","IIS-RequestMonitor","IIS-HttpTracing","IIS-BasicAuthentication","IIS-CertProvider","IIS-ClientCertificateMappingAuthentication","IIS-DigestAuthentication","IIS-IISCertificateMappingAuthentication","IIS-IPSecurity","IIS-URLAuthorization","IIS-WindowsAuthentication","IIS-ApplicationDevelopment","IIS-ISAPIExtensions","IIS-ISAPIFilter","NetFx4Extended-ASPNET45","IIS-NetFxExtensibility45","IIS-ApplicationInit","IIS-ASP","IIS-ASPNET45","IIS-CGI","IIS-ServerSideIncludes","IIS-WebSockets","IIS-HttpCompressionDynamic","IIS-WebServerManagementTools","IIS-ManagementConsole","IIS-ManagementService","IIS-ManagementScriptingTools","IIS-HttpRedirect"]
node.default['iis-nativex']['enabled_pools'] = [{:pool_name => "api.w3i.com", :runtime_version => "4.0", :pipeline_mode => :Integrated, :pool_username => "#{creds['api']['app_pool_username']}", :pool_password => "#{creds['api']['app_pool_password']}"},{:pool_name => "ml.w3i.com", :runtime_version => "4.0", :pipeline_mode => :Integrated, :pool_username => "#{creds['ml']['app_pool_username']}", :pool_password => "#{creds['ml']['app_pool_password']}"}]
node.default['iis-nativex']['enabled_sites'] = [{:site_name => "api.w3i.com", :protocol => :http, :port => 80, :path => "C:\\inetpub\\wwwroot\\api.w3i.com", :host_header => ["api.w3i.com","appclick.co"], :pool_name => "api.w3i.com"},{:site_name => "ml.w3i.com", :protocol => :http, :port => 80, :path => "C:\\inetpub\\wwwroot\\ml.w3i.com", :host_header => ["ml.w3i.com"], :pool_name => "ml.w3i.com"}]

include_recipe "role-win-base-nativex"
include_recipe "iis-nativex"

