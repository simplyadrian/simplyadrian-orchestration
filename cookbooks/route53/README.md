Description
===========

Updates Amazon Web Service's Route 53 (DNS) service.

Requirements
============

An Amazon Web Services account and a Route 53 zone.

Usage
=====

```ruby
include_recipe "route53"

route53_record "create a record" do
  name  "test"
  value "16.8.4.2"
  type  "A"
  zone_id               node[:route53][:zone_id]
  aws_access_key_id     node[:route53][:aws_access_key_id]
  aws_secret_access_key node[:route53][:aws_secret_access_key]
  overwrite true
  action :create
end
```

NOTE: If you do not specify aws credentials, it will attempt
 to use the AWS IAM Role assigned to the instance instead.

Testing
=======

```ruby
bundle install

librarian-chef install
```

Edit .kitchen.yml and update attribute values.

```ruby
kitchen converge
```
