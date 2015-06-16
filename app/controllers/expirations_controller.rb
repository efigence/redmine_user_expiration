class ExpirationsController < ApplicationController
  unloadable

  def index
    @expirations = Expiration.all
  end


end
