class Expiration < ActiveRecord::Base
  unloadable

  belongs_to :user

  attr_accessible :user_id, :expiration_date
end
