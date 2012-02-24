class Role < ActiveRecord::Base
  has_many :users, :through => :memberships
  has_many :memberships

  validates_presence_of :name
  validates_uniqueness_of :name

end


# == Schema Information
#
# Table name: roles
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

