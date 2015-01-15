class Tweet < ActiveRecord::Base
  validates_length_of :content, maximum: 140
  validates_presence_of :content

end
