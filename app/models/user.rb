class User

  extend ActiveModel::Naming
  #include ActiveModel::AttributeMethods
  #include ActiveModel::Serialization

  attr_accessor :id, :username, :first_name, :last_name, :created_at, :password, :updated_at

  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end

  def to_s
    self.username
  end
end
