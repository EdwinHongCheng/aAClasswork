class Cat < ApplicationRecord
    validates :birth_date, :color, :name, :sex, :description, presence: true
end
