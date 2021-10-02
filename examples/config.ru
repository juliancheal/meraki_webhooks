# rackup -Ilib examples/config.ru

require_relative './application'

use Rack::Reloader, 0
run Application.new
