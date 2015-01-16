require 'four_eyes/version'
require 'four_eyes/controller_resource'
require 'four_eyes/controller_additions'
require 'four_eyes/inherited_resource'

module FourEyes
  # Your code goes here...
  class Engine < Rails::Engine
    isolate_namespace FourEyes
  end
end