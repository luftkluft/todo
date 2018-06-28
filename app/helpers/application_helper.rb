module ApplicationHelper
  def superrole_free?(users)
    @users = users
    print @users
    begin
      @users.each do |r|
        if r.role == "superuser"
          return false
        end
      end
      return true
    rescue
      print "error_check_free_superuser"
    end
  end
end
