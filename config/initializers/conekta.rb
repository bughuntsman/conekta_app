# Load the gem
require 'conekta'

# Setup authorization
Conekta.configure do |config|
  # Configure Bearer authorization: bearerAuth
  config.access_token = 'Bearer key_nhBdElDQSWTYbMzRbIU5DOL'
  # Configure a proc to get access tokens in lieu of the static access_token configuration
  config.access_token_getter = -> { 'key_nhBdElDQSWTYbMzRbIU5DOL' } 
  # Configure faraday connection
  config.configure_faraday_connection { |connection| 'YOUR CONNECTION CONFIG PROC' }
end

api_instance = Conekta::AntifraudApi.new
create_risk_rules_data = Conekta::CreateRiskRulesData.new({description: 'this client email was verified at 20/09/22 by internal process', field: 'email | phone | card_token', value: 'email@example.com | 818081808180 | src_2qUCNd5AyQqfPMBuV'}) # CreateRiskRulesData | requested field for blacklist rule
opts = {
  accept_language: 'es' # String | Use for knowing which language to use
}

begin
  #Create blacklisted rule
  result = api_instance.create_rule_blacklist(create_risk_rules_data, opts)
  p result
rescue Conekta::ApiError => e
  puts "Exception when calling AntifraudApi->create_rule_blacklist: #{e}"
end
