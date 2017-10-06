require "twitter"

puts "please according to instructions"
puts "account_ID =>"
ac_id = gets.chomp
puts "consumer_key =>"
con_key = gets.chomp
puts "consumer_secret =>"
con_sec = gets.chomp
puts "access_token =>"
acc_tkn = gets.chomp
puts "access_token_secret =>"
acc_tkn_sec = gets.chomp

client = Twitter::REST::Client.new do |config|
  config.consumer_key = con_key
  config.consumer_secret = con_sec
  config.access_token = acc_tkn
  config.access_token_secret = acc_tkn_sec
end

loop do
print "\e[35mchapitter>>\e[0m "

a,b = gets.split(" ")

case a
  when "tw" then
    if b!= nil
      client.update(b)
      puts "sucessful!!"
    else
      puts "please put the sentence"
      b=gets
      client.update(b)
      puts "sucessful!!"
    end

  when "mytl" then
    if b!=nil
      client.user_timeline(ac_id, { count: b } ).each do |timeline|
        tweet = client.status(timeline.id)
        puts tweet.created_at
        puts tweet.text
        print "\e[32mRT: #{tweet.retweet_count}\e[0m "
        puts "\e[32mFAV: #{tweet.favorite_count}\e[0m"
        print "\n"
      end
    else
      client.user_timeline(ac_id, { count: 10 } ).each do |timeline|
        tweet = client.status(timeline.id)
        puts "\e[34m#{tweet.created_at}\e[0m"
        puts tweet.text
        print "\e[32mRT: #{tweet.retweet_count}\e[0m "
        puts "\e[32mFAV: #{tweet.favorite_count}\e[0m"
        print "\n"
      end
    end

  when "tl" then
    client.home_timeline.each do |tweet|
      print "\e[34m#{tweet.user.name}\e[0m "
      puts "(\e[34m#{tweet.user.screen_name}\e[0m)"
      puts tweet.full_text
      print "\e[32mRT: #{tweet.retweet_count}\e[0m "
      puts "\e[32mFAV: #{tweet.favorite_count}\e[0m"
      print "\n"
    end
  when "prf" then
    puts "***** My Profile ******"
    puts "NAME: #{client.user.name}"
    puts "ID: #{client.user.screen_name}"
    puts "DESCRIPTION: #{client.user.description}"
    puts "LOCATION: #{client.user.location}"
    puts "FOLLOW: #{client.user.friends_count}"
    puts "FOLLOWERS: #{client.user.followers_count}"
    puts "TWEET COUNT: #{client.user.statuses_count}"
    puts "FAVORITE COUNT: #{client.user.favourites_count}"

  when "exit","end" then
    break
    
end
end

