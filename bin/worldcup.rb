#!/usr/bin/env ruby

lib = File.expand_path(File.dirname(__FILE__) + '/../lib')
$LOAD_PATH.unshift(lib) if File.directory?(lib) && !$LOAD_PATH.include?(lib)

require 'optparse'
require 'world_cup'

options = {}
OptionParser.new do |opts|
  opts.banner = "Usage: worldcup [options]"

  options[:day_delta] = 0

  opts.on( '-y', '--yesterday', "Display yesterday's results" ) do
    options[:day_delta] = -1
  end

  opts.on( '-t', '--tomorrow', "Display information for tomorrow's matches" ) do
    options[:day_delta] = 1
  end

  opts.on( '-h', '--help', 'Display this screen' ) do
    puts opts
    exit
  end

end.parse!

world_cup_results = WorldCup::Results.new(ARGV, options)
world_cup_results.render