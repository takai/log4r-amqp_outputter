require 'simplecov'
require 'log4r'

SimpleCov.start do
  add_filter "/spec/"
end

require 'log4r/amqp_outputter'
require 'log4r/amqp_outputter_consumer'
