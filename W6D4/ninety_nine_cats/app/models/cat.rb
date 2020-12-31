require 'action_view'

class Cat < ApplicationRecord
    include ActionView::Helpers::DateHelper
    
    validates :birth_date, :color, :name, :sex, :description, presence: true 

    def age
        time_ago_in_words(birth_date)
    end
end
