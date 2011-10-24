class Admin::MainMenuCell < ::Admin::MenuCell
  include Devise::Controllers::Helpers
  
  protected
  
  alias_method :old_build_list, :build_list
  
  def build_list
    old_build_list
    add :sites, :url => admin_sites_path if current_account.manager?
  end
  
  ## TODO find a way to include the helper method from controller in cells
  def current_account
    klass, id, salt = *session["warden.user.admin.key"]
    @current_account ||= Account.find(id).first  
  end
  
end
