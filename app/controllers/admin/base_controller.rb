module Admin
  class BaseController < InheritedResources::Base
    helper_method :current_account
    
    def current_account
      klass, id, salt = *session["warden.user.admin.key"]
      @current_account ||= Account.find(id).first  
    end
    
  end
end

