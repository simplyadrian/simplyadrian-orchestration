#
# Cookbook Name:: role-iis-webserver-nativex
# Recipe:: default
#
# Copyright 2015, NativeX
#
# All rights reserved - Do Not Redistribute
#

creds = Chef::EncryptedDataBagItem.load('credentials', 'iis_app_pool_creds')

node.default['iis-nativex']['features'] = ["IIS-HttpLogging","IIS-CustomLogging","IIS-LoggingLibraries","IIS-ODBCLogging","IIS-RequestMonitor","IIS-HttpTracing",
										   "IIS-BasicAuthentication","IIS-CertProvider","IIS-ClientCertificateMappingAuthentication","IIS-DigestAuthentication",
										   "IIS-IISCertificateMappingAuthentication","IIS-IPSecurity","IIS-URLAuthorization","IIS-WindowsAuthentication",
										   "IIS-ApplicationDevelopment","IIS-ISAPIExtensions","IIS-ISAPIFilter","NetFx4Extended-ASPNET45",
										   "IIS-NetFxExtensibility45","IIS-ApplicationInit","IIS-ASP","IIS-ASPNET45","IIS-CGI","IIS-ServerSideIncludes","IIS-WebSockets",
										   "IIS-HttpCompressionDynamic","IIS-WebServerManagementTools","IIS-ManagementConsole","IIS-ManagementService",
										   "IIS-ManagementScriptingTools","IIS-HttpRedirect","MSMQ","MSMQ-Services","MSMQ-Server","WCF-HTTP-Activation45","ManagementOdata",
										   "WCF-MSMQ-Activation45","WCF-Pipe-Activation45","WCF-TCP-Activation45","Server-RSAT-SNMP","SNMP","WMISNMPProvider",
										   "Microsoft-Windows-Web-Services-for-Management-IIS-Extension"]

node.default['iis-nativex']['enabled_pools'] = [{:pool_name => 'api.w3i.com',
													:runtime_version => '4.0',
													:pipeline_mode => :Integrated,
													:pool_username => "#{creds['api']['app_pool_username']}",
													:pool_password => "#{creds['api']['app_pool_password']}"}]

node.default['iis-nativex']['enabled_sites'] = [{:site_name => 'external.api.w3i.com',
													:protocol => :http,
													:port => 80,
													:path => 'C:\\inetpub\\wwwroot\\external.api.w3i.com',
													:host_header => ['','api.w3i.com','appclick.co'],
													:pool_name => 'api.w3i.com'}]

if node[:kernel][:machine] == "x86_64"
  externalCache = "http://download.microsoft.com/download/3/4/1/3415F3F9-5698-44FE-A072-D4AF09728390/ExternalDiskCache_amd64_en-US.msi"
  webFarm = "http://download.microsoft.com/download/3/4/1/3415F3F9-5698-44FE-A072-D4AF09728390/webfarm_amd64_en-US.msi"
  requestRouter = "http://download.microsoft.com/download/6/3/D/63D67918-483E-4507-939D-7F8C077F889E/requestRouter_x64.msi"
  arrRewrite = "http://download.microsoft.com/download/6/7/D/67D80164-7DD0-48AF-86E3-DE7A182D6815/rewrite_amd64_en-US.msi"
else
  externalCache = "http://download.microsoft.com/download/4/D/F/4DFDA851-515F-474E-BA7A-5802B3C95101/ExternalDiskCache_x86_en-US.msi"
  webFarm = "http://download.microsoft.com/download/5/7/0/57065640-4665-4980-A2F1-4D5940B577B0/webfarm_v1.1_amd64_en_US.msi"
  requestRouter = "http://download.microsoft.com/download/6/3/D/63D67918-483E-4507-939D-7F8C077F889E/requestRouter_x86.msi"
  arrRewrite = "http://download.microsoft.com/download/6/9/C/69C1195A-123E-4BE8-8EDF-371CDCA4EC6C/rewrite_x86_en-US.msi"
end

node.default['iis-nativex']['arr_application'] = [{:package_name => 'webFarm',
													:source => webFarm,
													:installer_type => :msi},
												  {:package_name => 'ExternalDiskCache',
												  	:source => externalCache,
												  	:installer_type => :msi},
												  {:package_name => 'arrRewrite',
												  	:source => arrRewrite,
												  	:installer_type => :msi},
												  {:package_name => 'requestRouter',
												  	:source => requestRouter,
												  	:installer_type => :msi}]

node.default['iis-nativex']['services'] = [{:service_name =>'W3SVC'},{:service_name =>'WMSVC'}]
node.default['iis-nativex']['arr_helper']['schema_dir'] = 'C:\\Windows\\System32\\inetsrv\\config\\'
node.default['iis-nativex']['arr_helper']['x_forwarded_for_header_name'] = 'nativex-clientip'
node.default['iis-nativex']['arr_helper']['ssl_header_name'] = 'X-ARR-SSL'
node.default['iis-nativex']['arr_helper']['client_header_name'] = 'X-ARR-ClientCert'
node.default['iis-nativex']['arr_helper']['log_guid_name'] = 'X-ARR-LOG-ID'

include_recipe 'role-win-base-nativex'
include_recipe 'iis-nativex'
include_recipe 'iis-nativex::install-arr-features'
include_recipe 'iis-nativex::install-arr-helper'