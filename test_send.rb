# Include the helper gateway class
require './AfricasTalkingGateway'

# Specify your login credentials
username = "MyAfricasTalkingUsername";
apikey   = "MyAfricasTalkingAPIKey";

# Specify the numbers that you want to send to in a comma-separated list
# Please ensure you include the country code (+254 for Kenya in this case)
to      = "+254711XXXYYYZZZ,+254733XXXYYYZZZ";

# And of course we want our recipients to know what we really do
message = "I'm a lumberjack and it's ok, I sleep all night and I work all day"

# Create a new instance of our awesome gateway class
gateway = AfricasTalkingGateway.new(username, apikey)

# Any gateway errors will be captured by our custom Exception class below,
# so wrap the call in a try-catch block
begin
  # Thats it, hit send and we'll take care of the rest.
  reports = gateway.sendMessage(to, message)
  reports.each {|x|
    # Note that only the Status "Success" means the message was sent
    puts 'number=' + x.number + ';status=' + x.status + ';messageId=' + x.messageId + ';cost=' + x.cost
  }
rescue AfricasTalkingGatewayError => ex
  puts 'Encountered an error: ' + ex.message
end

# DONE!


