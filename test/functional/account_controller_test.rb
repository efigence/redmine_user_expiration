require File.expand_path('../../test_helper', __FILE__)

class AccountControllerTest < ActionController::TestCase
  fixtures :users

  def setup
    User.current = nil
  end

  def test_login_should_allow_login_with_future_expiration_date
    # request.uri is "test.host" in test environment
    back_urls = [
      '/'
    ]
    back_urls.each do |back_url|
      post :login, :username => 'jsmith', :password => 'jsmith', :back_url => back_url
      assert_redirected_to back_url
    end
  end

  def test_login_should_allow_login_without_expiration_date
    # request.uri is "test.host" in test environment
    back_urls = [
      '/'
    ]
    back_urls.each do |back_url|
      post :login, :username => 'dlopper', :password => 'foo', :back_url => back_url
      assert_redirected_to back_url
    end
  end

  def test_login_should_not_allow_login_with_past_expiration_date
    post :login, :username => 'admin', :password => 'admin'
    assert_redirected_to '/login'
    assert_include 'locked', flash[:error]
    assert_nil @request.session[:user_id]
  end

end
