$: << File.join(File.dirname(__FILE__), "/../lib" )
require 'urbanterror_stats'

RSpec.configure do |config|
    config.color_enabled = true
    config.formatter     = 'documentation'
end
