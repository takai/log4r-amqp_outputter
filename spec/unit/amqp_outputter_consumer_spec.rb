require 'spec_helper'

describe Log4r::AMQPOutputterConsumer do
  it 'logs packed message' do
    logger = double
    logger.should_receive(:info).with(an_instance_of(Log4r::AMQPOutputterConsumer::LogEvent), true)

    payload = MessagePack.pack 'lname' => 'info', 'data' => 'message'

    consumer = Log4r::AMQPOutputterConsumer.new logger
    consumer.handle_message nil, payload
  end
end
