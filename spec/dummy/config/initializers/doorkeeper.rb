Doorkeeper.configure do
  # This block will be called to check whether the
  # resource owner is authenticated or not
  resource_owner_authenticator do |routes|
    # Put your resource owner authentication logic here.
    # If you want to use named routes from your app you need
    # to call them on routes object eg.
    # routes.new_user_session_path
    # e.g. User.find_by_id(session[:user_id]) || redirect_to(routes.new_user_session_url)
    User.find_by_id(session[:user_id]) || redirect_to(routes.root_url, :alert => "Needs sign in.")
  end

  # If you want to restrict the access to the web interface for
  # adding oauth authorized applications you need to declare the
  # block below
  # admin_authenticator do |routes|
  #   # Put your admin authentication logic here.
  #   # If you want to use named routes from your app you need
  #   # to call them on routes object eg.
  #   # routes.new_admin_session_path
  #   Admin.find_by_id(session[:admin_id]) || redirect_to(routes.new_admin_session_url)
  # end

  authorization_scopes do
    scope :public, :default => true, :description => "The public one"
    scope :write, :description => "Updating information"
  end

  # Access token expiration time (default 2 hours)
  # access_token_expires_in 2.hours

  # Issue access tokens with refresh token (disabled by default)
  use_refresh_token
end
