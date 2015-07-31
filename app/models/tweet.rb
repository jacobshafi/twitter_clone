class Tweet < ActiveRecord::Base
 validates :description, length: { maximum: 144, minimum: 1 }

 has_many :retweets
 has_many :users, through: :retweets
end
