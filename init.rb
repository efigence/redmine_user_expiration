Redmine::Plugin.register :user_expiration do
  name 'User Expiration plugin'
  author 'Maria Syczewska'
  description 'This is a plugin for Redmine for implementing and managing user expiration date'
  version '0.0.1'
  url 'https://github.com/efigence/redmine_user_expiration'
  author_url 'https://github.com/efigence'
end

ActionDispatch::Callbacks.to_prepare do
  require 'user_expiration/hooks/expiration_date'
  require 'user_expiration/patches/user_patch'
end
