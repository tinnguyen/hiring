class Subdomain
  def self.matches?(request)
    if APP_CONFIG['single_acc']
    	true
    else
    	request.subdomain(APP_CONFIG['tld_length']).present? && request.subdomain(APP_CONFIG['tld_length']) != "www"
    end
  end
end
