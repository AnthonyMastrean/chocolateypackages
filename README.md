# Chocolatey::Rake
Rake tasks for Chocolatey packages.

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
    
And enjoy the benefits of automatic tasks like

    cpack_all
    cinst_all
    cpush_all
