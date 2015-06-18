require File.expand_path('../../test_helper', __FILE__)

class AccountTest < Redmine::IntegrationTest
  fixtures :users

  def setup
    log_user("jsmith", "jsmith")
  end

  def test_hook_should_fetch_expiration_date
    get '/users/1/edit'
    assert_response :success
    assert_select '#user_expiration_date'
  end

end
