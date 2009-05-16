$:.unshift(File.dirname(__FILE__)) unless
  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

module CronWTF
end
  
require 'rcronwtf/table'
require 'rcronwtf/entry'