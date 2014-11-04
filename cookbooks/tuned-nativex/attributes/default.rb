# TuneD Default Attributes
default['tuned']['active_profile']        = "default"
default['tuned']['profiles_dir']          = "/etc/tune-profiles"
default['tuned']['known_custom_profiles'] = Set.new([
                                              "cassandra-ssd-storage"
                                            ])
default['tuned']['files_in_each_profile'] = Set.new([
                                              "ktune.sh",
                                              "ktune.sysconfig",
                                              "sysctl.ktune",
                                              "tuned.conf"
                                            ])