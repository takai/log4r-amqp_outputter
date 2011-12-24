require 'amqp'
require 'msgpack'

require 'log4r/config'
require 'log4r/outputter/outputter'

module Log4r
  class AMQPOutputter < Outputter
    include Log4r::Log4rConfig

    def initialize name, opts
      super(name, opts)
      @routing_key = opts[:routing_key] || 'log4r.amqp'
    end

    def canonical_log logevent
      msg = MessagePack.pack('lname'    => LNAMES[logevent.level].downcase,
                             'data'     => logevent.data,
                             'fullname' => logevent.fullname,
                             'level'    => logevent.level,
                             'name'     => logevent.name,
                             'tracer'   => logevent.tracer)

      synch do
        channel = AMQP::Channel.new AMQP.connection
        exchange = channel.default_exchange
        exchange.publish msg, :routing_key => @routing_key
      end
    end

  end
end
