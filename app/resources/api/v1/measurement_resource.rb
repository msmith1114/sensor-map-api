module Api
    module V1
        class MeasurementResource < JSONAPI::Resource
            attributes :value, :measurement_unit, :measurement_type
            has_one :device

            filter :device
        end
    end
end