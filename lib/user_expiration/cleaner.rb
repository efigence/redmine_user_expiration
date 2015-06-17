class Cleaner

  def execute
    User.all.find_each(:conditions => "status = STATUS_ACTIVE)") do |u|
      if u.expiration_date <= Time.now.utc
        u.lock!
      end
    end
  end

end
