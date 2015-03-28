# Include the helper gateway class
require './AfricasTalkingGateway'

# Specify your login credentials
username = "Mutsmaingi";
apikey   = "c4659bc48c86f4fc5b6f43ecd71605f8579c8eb928337ef2afe83c16

6b7fbad3";

# Specify the numbers that you want to send to in a comma-separated list
# Please ensure you include the country code (+254 for Kenya in this case)
to      = "+254723426352";

# And of course we want our recipients to know what we really do
message = "I love ruby so much. I will be a good programer"

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


