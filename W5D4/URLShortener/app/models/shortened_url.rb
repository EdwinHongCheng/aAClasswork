# == Schema Information
#
# Table name: shortened_urls
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  long_url   :string           not null
#  short_url  :string           not null
#  user_id    :integer          not null
#
class ShortenedUrl < ApplicationRecord
    validates :short_url, presence: true, uniqueness: true
    validates :long_url, presence: true, uniqueness: true
end
