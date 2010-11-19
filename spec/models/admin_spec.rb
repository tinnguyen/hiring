# == Schema Information
#
# Table name: admins
#
#  id                   :integer         not null, primary key
#  email                :string(255)     default(""), not null
#  encrypted_password   :string(128)     default(""), not null
#  password_salt        :string(255)     default(""), not null
#  reset_password_token :string(255)
#  remember_token       :string(255)
#  remember_created_at  :datetime
#  sign_in_count        :integer         default(0)
#  current_sign_in_at   :datetime
#  last_sign_in_at      :datetime
#  current_sign_in_ip   :string(255)
#  last_sign_in_ip      :string(255)
#  failed_attempts      :integer         default(0)
#  unlock_token         :string(255)
#  locked_at            :datetime
#  created_at           :datetime
#  updated_at           :datetime
#

#require File.dirname(__FILE__) + '/../spec_helper'
class Admin
	attr_accessor :email, :password, :password_confirmation
	def initialize(email, password, password_confirmation)
		@email = email
		@password = password
		@password_confirmation = password_confirmation
	end	
	def auth?
		if (@email == "a@b.com" and @password == "123456" and @password_confirmation == "123456")
			return true		
		return false							
	end
end


describe Admin do
	it "should be a valid admin" do
		admin = Admin.new("a@b.com", "123456", "123456")
		admin.should be_auth
	end
	
end
end

