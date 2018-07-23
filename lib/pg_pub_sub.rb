class PgPubSub
  def initialize(channel)
    @channel = channel
  end
  def subscribe
    connect do |connection|
      begin
        connection.execute "LISTEN C#{@channel}"
        loop do
          connection.raw_connection.wait_for_notify(2) do |event, id, data|
            yield data
          end
        end
      ensure
        connection.execute "UNLISTEN C#{@channel}"
      end
    end
  end

  def publish(json)
    connect do |connection|
      connection.execute "NOTIFY C#{@channel}, #{connection.quote json}"
    end
  end

  private
  def connect(&block)
    ActiveRecord::Base.connection_pool.with_connection(&block)
  end
end
