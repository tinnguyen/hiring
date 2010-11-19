class UserMailer < ActionMailer::Base
  default :from => "no-reply@hiring.com"
  
  def welcome_email(invitation)
    @invitation = invitation
    @url = new_user_url :token => @invitation.token,
    	:host => "hiring.com",
    	:subdomain => @invitation.inviter.account.subdomain
    mail :to => invitation.email,
    	:subject => "You are invited to join #{@invitation.inviter.account.name} on HiringApp"
  end
  
  def conversation_email(applicant, conversation)
    @message = conversation.body
    setting	=	applicant.job.email_setting
    if setting.username.nil? || setting.username.to_s == '' || 
    	setting.password.nil? || setting.password.to_s == ''
    	setting	=	applicant.account.email_setting
    end
    
    if conversation.attachment
      attachments["#{conversation.attachment.original_filename}"] = File.read(conversation.attachment.path)
    end
    mail 	:from => "Hiring App",
  				:reply_to =>  setting.username,
  				:return_path =>  setting.username,
          :to => applicant.email,
          :subject => conversation.subject,
          :body => @message
  end
end
