
#Comment or uncomment out the following line to active/inactivate single account mode
#APP_CONFIG = YAML.load_file("#{RAILS_ROOT}/config/config.yml.single_account_sample")[RAILS_ENV]

#Comment or uncomment out the following line to active/inactivate multi account mode
APP_CONFIG = YAML.load_file("#{RAILS_ROOT}/config/config.yml.multi_account_sample")[RAILS_ENV]
