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

require 'securerandom'

class ShortenedUrl < ApplicationRecord
    validates :short_url, presence: true, uniqueness: true
    validates :long_url, presence: true, uniqueness: true

    def self.random_code
        short = SecureRandom.urlsafe_base64

        while ShortenedUrl.exists?(:short_url => short)
            short = SecureRandom.urlsafe_base64
        end
        short
    end

    def self.generate_short_url(user, long_url)
        ShortenedUrl.create!(long_url: long_url, short_url: ShortenedUrl.random_code, user_id: user.id)
    end

    belongs_to :submitter,
        primary_key: :id,
        foreign_key: :user_id,
        class_name: :User
end
