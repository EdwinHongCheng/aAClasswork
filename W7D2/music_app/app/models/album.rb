class Album < ApplicationRecord
  validates :title, :year, :band_id, :live?, presence: true

  belongs_to :band,
   primary_key: :id, 
   foreign_key: :band_id, 
   class_name: :Band
end
