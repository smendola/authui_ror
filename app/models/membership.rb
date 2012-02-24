class Membership < ActiveRecord::Base
  belongs_to :user
  belongs_to :role
  has_one :user
  has_one :role
end



# == Schema Information
#
# Table name: memberships
#
#  id         :integer         not null, primary key
#  user_id    :integer
#  role_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

