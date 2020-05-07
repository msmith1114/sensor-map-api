module Api
    module V1
        class DeviceResource < JSONAPI::Resource
            attributes :name, :serial_number, :latitude, :longitude, :device_status 
            has_many :measurements
        end
    end 
end