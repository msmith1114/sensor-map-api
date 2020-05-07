class Measurement < ApplicationRecord
  enum measurement_unit: {fahrenheit: 0, percent: 1, hectopascal: 2}
  enum measurement_type: {temperature: 0, humidity: 1, barometric_pressure: 2}
  belongs_to :device
end
