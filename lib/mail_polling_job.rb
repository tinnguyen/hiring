class MailPollingJob
  def perform
    settings = EmailSetting.where(:configurable_type => "Account")
    settings.each do |setting|
      config = {
        :server => setting.server,
        :port => setting.port,
        :ssl => setting.ssl,
        :username => setting.username,
        :password => setting.password
      }
      if setting.protocol == "POP3"
        MailPoller::Pop3Fetcher.fetch("MailReceiver", config)
      else
        MailPoller::ImapFetcher.fetch("MailReceiver", config)
      end
    end
  end
end
