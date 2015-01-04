class IncomingController < ApplicationController

  # http://stackoverflow.com/questions/1177863/how-do-i-ignore-the-authenticity-token-for-specific-actions-in-rails
  skip_before_action :verify_authenticity_token, only: [:create]

  def create
    # Take a look at these in your server logs
    # to get a sense of what you're dealing with.
    #puts "INCOMING PARAMS HERE: #{params}"
    puts " ***** USER EMAIL: #{params[:sender]}"
    puts " ***** TOPIC: #{params[:subject]}"
    puts " ***** BOOKMARK: #{params['stripped-text']}"
      # sender: "dave@gmaiol.com", subject: "my subject"....
      # topic = regex on subject here to get topic name (steelers instead of #steelers)
      # subject: #steelers #bengals #nfl
      # http://highlightofgame.com

      @bookmark = Bookmark.find_or_create_by_url(params['stripped-text'])
      @user = User.find_by_email(params[:sender]) 

      @topics = params[:subject].gsub(/(^#+)|(\s#)/,'').split(' ')
      # .. @topics = ["steelers", "bengals", "nfl"]
      # to get there from above, split on spaces, then do a regexx replace of # (and replace it with '')
      # iterate through topics and find or create by name for each one
      @topics.each do |topic_name|
          topic = Topic.find_or_create_by_name(topic_name)
            if !@bookmark.topic 
              @bookmark.topic = topic
              @bookmar.save
            end
      end

      if !@bookmark.user
        @bookmark.user_id = @user.id
        @bookmark.save
      end


          # add bookmark to topic unless topic includes bookmark
      # end
      # add bookmark to user unless user include bookmark

    
    

    # You put the message-splitting and business
    # magic here. 

    # Assuming all went well. 
    head 200
  end
end