require 'config/boot'
require 'config/environment'
require 'conversation_polling_job'
require 'mail_polling_job'

handler do |job|
  puts "Running #{job} ..."
end

every(1.minutes, 'mail.polling') { Delayed::Job.enqueue MailPollingJob.new }
every(1.minutes, 'conversation.polling') { Delayed::Job.enqueue ConversationPollingJob.new }
