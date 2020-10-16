module ApplicationHelper
  def superrole_free?(users)
    @users = users
    print @users
    begin
      @users.each do |r|
        return false if r.role == 'superuser'
      end
      true
    rescue StandardError
      print 'error_check_free_superuser'
    end
  end
end
