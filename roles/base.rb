name "base"
description "Base role applied to all nodes."
run_list(
  "recipe[users::sysadmins]",
  "recipe[sudo]",
  "recipe[yum]",
  "recipe[yum-epel]",
  "recipe[yum-upgrade]",
  "recipe[git]",
  "recipe[vim]"
) 
override_attributes(
  :authorization => {
    :sudo => {
      :users => ["adrian.herrera"],
      :passwordless => true
    }
  }
)
