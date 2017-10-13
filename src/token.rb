require "twitter"

def tkn
  puts "please according to instructions"
  puts "account_ID =>"
  @ac_id = gets.chomp
  puts "consumer_key =>"
  con_key = gets.chomp
  puts "consumer_secret =>"
  con_sec = gets.chomp
  puts "access_token =>"
  acc_tkn = gets.chomp
  puts "access_token_secret =>"
  acc_tkn_sec = gets.chomp

  @client = Twitter::REST::Client.new do |config|
    config.consumer_key = con_key
    config.consumer_secret = con_sec
    config.access_token = acc_tkn
    config.access_token_secret = acc_tkn_sec
  end
end