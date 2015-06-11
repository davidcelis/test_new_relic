# encoding: utf-8
require File.expand_path('../config/application', __FILE__)

require 'new_relic/rack/developer_mode'
use NewRelic::Rack::DeveloperMode

# Your Crepe is ready.
run Crepe.application
