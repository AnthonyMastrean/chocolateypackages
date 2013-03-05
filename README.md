# Chocolatey::Rake
Rake tasks for Chocolatey packages.

    cpack_all
    cinst_all
    cpush_all

## Installation
Add this line to your application's Gemfile:

    gem 'chocolatey-rake'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install chocolatey-rake

## Usage
In your rakefile, 

    require 'chocolatey/rake'
    
And enjoy the benefits of the automatic pack, install, and publish tasks. Some things to note, this gem will

 * generate a task per nuspec that it finds recursively in all directories
 * use underscores in all task names (a Ruby idiom) in place of dashes (a kind-of .NET idiom)

## Example
Check out the example rakefile and chocolatey packages in the `example/` directory. Try running

    rake -P
    
to see how all of the tasks are generated

    rake cinst_all
        cinst_sample_package_1
        cinst_sample_package_2
    rake cpack_all
        cpack_sample_package_1
        cpack_sample_package_2
    rake cpush_all
        cpush_sample_package_1
        cpush_sample_package_2
