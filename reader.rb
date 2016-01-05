#!/Users/dharmesh/.rvm/rubies/ruby-2.2.1/bin/ruby
# Script Name: Reader.rb
# Author: Dharmesh Tarapore
# Purpose: Read messages without being seen on Facebook
# Version: v1
# Date: 5th January 2016

# We need the koala gem to work on this
require 'koala'

def get_inbox(token)
	# Get graph object
	graph = Koala::Facebook::API.new(token)
	messages = graph.get_connections("me", "inbox")
  messages.each_with_index do |message, index|
		users = []
		for names in message["to"]["data"]
			names.each do |name|
		    users.push(name[1])
		  end
		end
		puts "Participants: #{users}, Index: #{index}\n"
		users = []
	end
	puts "Select an index: \n"
	index = gets
	while not index.match(/^\d+$/)
		puts "Index must be an integer\n"
		index = gets
	end
	get_message(index.to_i, messages)
end

def get_message(index, messages)
	puts "\nParticipants: #{messages[index]["comments"]} \n"
end

def main
	# Get your token from: https://developers.facebook.com/tools/explorer/
	# The developers website does not update your last active timestamp.
	token = "Your FB Graph API token"
  get_inbox(token)
end

main
