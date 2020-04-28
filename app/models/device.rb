class Device < ApplicationRecord
    has_many :measurements

    # Validations
    validates :name, presence: true
    validates :serial_number, presence: true
end
