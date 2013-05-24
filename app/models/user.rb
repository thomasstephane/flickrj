class User < ActiveRecord::Base

  has_many :albums
  has_many :pitures


  include BCrypt

  
  def owner?(user_id = "")
    session[:user_id] == (user_id == "" ? self.id : user_id)
  end

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def authenticate?(name, pass)
    if user_exist(name)
      user.password == pass ? user_exist(name) : nil
    end
  end
end
