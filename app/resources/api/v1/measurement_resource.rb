module Api
    module V1
        class MeasurementResource < JSONAPI::Resource
            attributes :value, :measurement_unit
            has_one :device

            filter :device
        end
    end
end