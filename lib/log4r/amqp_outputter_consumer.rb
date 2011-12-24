require 'amqp'
require 'msgpack'

module Log4r
  class AMQPOutputterConsumer
    LogEvent = Struct.new :level, :tracer, :data, :name, :fullname

    def initialize logger
      @logger = logger
    end

    def handle_message metadata, payload
      msg = MessagePack.unpack payload
      logevent = LogEvent.new(msg['level'], msg['tracer'],
                              msg['data'], msg['name'], msg['fullname'])

      @logger.__send__ msg['lname'], logevent, true
    end
  end
end
