Ruby Cookbook
=============

Installs the [ruby](http://www.ruby-lang.org/) programming language
system wide. Also includes rubygems.

Requirements
------------

### Platforms ###

`ruby` has only been tested on the following platforms:

* Ubuntu 12.04

Attributes
----------

<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['ruby']['version']</tt></td>
    <td>String</td>
    <td>version to install, among <tt>'1.8'</tt>, <tt>'1.9'</tt>, <tt>'2.0'</tt></td>
    <td><tt>'1.9'</tt></td>
  </tr>
  <tr>
    <td><tt>['ruby']['compiletime']</tt></td>
    <td>Boolean</td>
    <td>whether to install ruby at compile-time</td>
    <td><tt>false</tt></td>
  </tr>
</table>

Usage
-----

Then just include the `ruby` recipe in your application's `metadata.rb`:

```ruby
name             'my_app'
version          '1.0.0'

depends 'ruby'
```

and `recipes/default.rb`: 

```ruby
include_recipe 'ruby'
```

Contributing
------------

1. Close a local copy of the chef repository from Github
2. Create a named feature branch (like `add_component_x`)
3. Write you change
4. Write tests for your change (if applicable)
5. Run the tests with `bundle exec rake all`, ensuring they all pass
6. Submit a Pull Request using Github
