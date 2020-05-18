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
            if data["type"] == "device" 
                if Device.exists?(name: data["device_name"])
                    puts "Device already exists, skipping device creation..."
                else
                    Device.create!(name: data["device_name"], serial_number: data["serial_number"], device_status: 0)
                end
            elsif data["type"] == "measurement"
                @device = Device.find_by(name: data["device_name"])
                @device.measurements.create(value: data["value"], measurement_unit: data["measurement_unit"], measurement_type: data["measurement_type"])   
            end
        end
      end
    end
end