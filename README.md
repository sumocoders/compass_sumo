compass_sumo
============

This is the gem for the SumoCoders default SCSS framework. Including a lot of usefull plugins

## Install

Installation is pretty straightforward throught RubyGems:

    gem install compass_sumo

## Usage

In setup.rb you require 'compass_sumo', and then you can import the compass files like this

    @import "compass";
    @import "compass_sumo";

Or you can import certain parts manually (to improve load time)

    @import "compass_sumo/mixins/animations"

