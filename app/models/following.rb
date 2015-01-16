class Following < ActiveRecord::Base
  belongs_to :leader, class_name: 'user'
  belongs_to :follower, class_name: 'user'

  # validates_uniqueness_of: :follower_id, scope: :leader_id
end
