class SignupController < ApplicationController

  def new
    render "main/signup", :layout => false
  end
  
  def create
    # Create account
    # TODO validate account params
    accnt_params = {
      :name => params[:user_name],
      :email => params[:email],
      :password => params[:password],
      :password_confirmation => params[:password_confirmation]
    }
    account = Account.create(accnt_params)
    
    # Create site
    # TODO validate site params
    site_params = {
      :name => params[:site_name],
      :subdomain => params[:subdomain].downcase.gsub(/ /, '')
    }
    site = Site.create(site_params)
    
    site.memberships.build(:account => account, :role => 'admin')
    
    if account.save! && site.save!
      sign_in(account)
      binding.pry
      # current_site = site
      redirect_to "http://#{site_params[:subdomain]}.#{Locomotive.config.domain}:3000/"
    end
  end
  
end