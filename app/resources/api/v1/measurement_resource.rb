module Api
    module V1
        class MeasurementResource < JSONAPI::Resource
            attributes :value, :measurement_unit, :measurement_type, :created_at
            has_one :device

            filter :device
            def created_at
                @model.created_at.strftime("%Y-%m-%d %H:%M:%S %P")
            end
        end
    end
end