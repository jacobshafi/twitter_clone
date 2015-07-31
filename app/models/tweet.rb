class Tweet < ActiveRecord::Base
 validates :description, length: { maximum: 144, minimum: 1 }

 belongs_to :user
end
