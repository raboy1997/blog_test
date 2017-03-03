module SessionsHelper

  def sign_in(user)
    remember_token = User.new_remember_token #create a new token
    cookies.permanent[:remember_token] = remember_token #place the unencrypted token in the browser cookies ,
    # using permanent causes Rails to set the expiration to 20.years.from_now automatically.
    user.update_attribute(:remember_token, User.encrypt(remember_token)) #save the encrypted token to the database
    self.current_user = user #set the current user equal to the given user
  end

  def signed_in?
    !current_user.nil?
  end

  def current_user=(user)
    @current_user = user
  end

  def current_user
    remember_token = User.encrypt(cookies[:remember_token])
    @current_user ||= User.find_by(remember_token: remember_token)
  end
end
