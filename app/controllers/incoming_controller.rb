class IncomingController < ApplicationController

  # http://stackoverflow.com/questions/1177863/how-do-i-ignore-the-authenticity-token-for-specific-actions-in-rails
  skip_before_action :verify_authenticity_token, only: [:create]

  def create
    # Take a look at these in your server logs
    # to get a sense of what you're dealing with.
    puts "INCOMING PARAMS HERE: #{params}"
    # sender: "dave@gmaiol.com", subject: "my subject"....

    # @topic = Topic.find_or_create_by_name(params[:topic][:name])
    # @bookmark = Bookmark.find_or_create_by_url(url: url)
    # @user = User.find_by_email(params[:sender])

    
    # You put the message-splitting and business
    # magic here. 

    # Assuming all went well. 
    head 200
  end
end