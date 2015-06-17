class ExpirationDateHookListener < Redmine::Hook::ViewListener
  render_on :view_users_form, :partial => "users/expiration_date"
end
