require 'mqtt'
Rails.application.config.after_initialize  do
    begin
        client = MQTT::Client.connect('broker.mqttdashboard.com')
        client.subscribe('esp32_001')
    rescue
        puts "Unable to connect to client..."
    else
    Thread.new do
        client.get do |topic, message|
            data = JSON.parse(message)
            puts data
            # puts "Topic:#{topic} debug message:#{message}"
            # puts "Device #{data["device"]} reports measurement of #{data["value"]}"
            #puts "Creating device..."
            #@measurement = Device.find_by(name: topic).measurements.create(value: data["value"])
        end
      end
    end
end