General Info About Roles
-----------------------
Create roles here, in either the Role Ruby DSL (.rb) or JSON (.json) files. To install roles on the server, use knife.

For example, create `roles/base_example.rb`:

    name "base_example"
    description "Example base role applied to all nodes."
    # List of recipes and roles to apply. Requires Chef 0.8, earlier versions use 'recipes()'.
    #run_list()
    # Attributes applied if the node doesn't have it set already.
    #default_attributes()
    # Attributes applied no matter what the node has set already.
    #override_attributes()

Then upload it to the Chef Server:
    
    knife role from file roles/base_example.rb

Roles at NativeX
----------------
These role definitions should be very simple. We have decided to use the 'role cookbook' paradigm, so roles as they are defined here can should ideally wrap the `default` recipe of a corresponding role cookbook and nothing more.  That means no attribute definitions or run_list specification (other than the role-cookbook) -- all of that should go in the role cookbook.
