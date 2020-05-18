class Device < ApplicationRecord
    enum device_status: {active: 0, inactive: 1, unknown: 2}
    has_many :measurements
    # Validations
    validates :name, presence: true
    validates :serial_number, presence: true
end
