require "twitter"
require 'json'

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

  File.open("json/private.json", 'w') do |file|
    data = {
      "con_key" => con_key,
      "con_sec" => con_sec,
      "acc_tkn" => acc_tkn,
      "acc_tkn_sec" => acc_tkn_sec 
    }
    str = JSON.dump(data, file)
  end

  @client = Twitter::REST::Client.new do |config|
    config.consumer_key = con_key
    config.consumer_secret = con_sec
    config.access_token = acc_tkn
    config.access_token_secret = acc_tkn_sec
  end
end

def tkn_sub
  File.open("json/private.json", 'r') do |file|
    data = JSON.load(file)
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key = data["con_key"]
      config.consumer_secret = data["con_sec"]
      config.access_token = data["acc_tkn"]
      config.access_token_secret = data["acc_tkn_sec"]
    end
  end
end
