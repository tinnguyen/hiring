class Conversation < ActiveRecord::Base
  belongs_to :applicant
  
  DELIMITER = "--- PLEASE COPY AND PLACE THIS LINE AT THE END OF YOUR REPLY ---"
  attr_accessor :attachment
end



# == Schema Information
#
# Table name: conversations
#
#  id           :integer         not null, primary key
#  content_type :string(255)
#  message      :text
#  outgoing     :boolean
#  applicant_id :integer
#  created_at   :datetime
#  updated_at   :datetime
#  subject      :string(255)
#

