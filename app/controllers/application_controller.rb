class ApplicationController < ActionController::Base
  include SimpleCaptcha::ControllerHelpers
  protect_from_forgery
  helper_method :current_account
  
  #	updated by trac.nguyen, 20101104
  #	check the mode of running in sigle account or not before action
  before_filter :check_account_available
  
protected

  def current_account
    @current_account ||= Account.find_current_account(current_subdomain)
  end
  
  #	updated by trac.nguyen, 20101104
  #	if single mode, find the account, if not found, redirect to the create account page
  def check_account_available
  	account_controller = 'main/accounts'
  	account_action = 'new'
  	if is_single_account?
  		if !Account.find(:first)
  			if self.controller_path != account_controller || (self.action_name != account_action && self.action_name != 'create')
  				redirect_to :controller => account_controller, :action => account_action
  			else
  				
  			end
  		else
  			#	if there is some record, redirect to the bulletin board
  			if self.controller_path == account_controller && self.action_name == account_action
  				redirect_to :controller => 'pub/jobs'
  			end
  		end
  	end
  end
  
  #	updated by trac.nguyen, 20101104
  #	check if in single account mode or not
  def is_single_account?
  	APP_CONFIG['single_acc']
  end
end
