class User
  attr_accessor :id, :username, :first_name, :last_name, :created_at, :password
  def initialize( attrs )
    @id = attrs[:id]
    @username = attrs[:username]
    @first_name = attrs[:first_name]
    @last_name = attrs[:last_name]
    @created_at = attrs[:created_at]
        @password = attrs[:password]
  end
end
