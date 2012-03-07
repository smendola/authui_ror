class User

  # TODO:  http://apidock.com/rails/ActiveModel/Errors

  extend ActiveModel::Naming
  include ActiveModel::Validations
  #include ActiveModel::Conversion
  #include ActiveModel::AttributeMethods
  #include ActiveModel::Serialization

  attr_accessor :id, :username, :first_name, :last_name, :created_at, :password, :updated_at
  attr_reader   :errors
  attr_accessor :persisted

  validates_presence_of :username, :last_name

  def initialize(attributes = {}, persisted=nil)
    attributes.each do |name, value|
      send("#{name}=", value)
    end
    @errors = ActiveModel::Errors.new(self)
    @persisted = !persisted.nil? ? persisted : !attributes.empty?
  end

  def to_key
    key = self.id
    [key] if key
  end

  def to_s
    self.username
  end

  def persisted?
    @persisted
  end
end
