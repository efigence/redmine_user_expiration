require File.expand_path('../../test_helper', __FILE__)

class AccountTest < ActionDispatch::IntegrationTest
  fixtures :users

  def log_user(login, password)
    User.anonymous
    get "/login"
    assert_equal nil, session[:user_id]
    assert_response :success
    assert_template "account/login"
    post "/login", :username => login, :password => password
    assert_equal login, User.find(session[:user_id]).login
  end

  def setup
    log_user("jsmith", "jsmith")
  end

  def test_hook_should_fetch_expiration_date
    get '/users/1/edit'
    assert_response :success
    assert_select '#user_expiration_date'
  end

end
