class User

  # TODO:  http://apidock.com/rails/ActiveModel/Errors

  extend ActiveModel::Naming
  include ActiveModel::Validations
  #include ActiveModel::Conversion
  #include ActiveModel::AttributeMethods
  #include ActiveModel::Serialization

  attr_accessor :id, :username, :first_name, :last_name, :created_at, :password, :updated_at
  validates_presence_of :username, :last_name

  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end

  def to_key
    key = self.id
    [key] if key
  end

  def to_s
    self.username
  end
end
