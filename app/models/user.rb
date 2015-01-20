class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook]

  has_many :bookmarks
  has_many :like_bookmarks
  
  
  def liked(bookmark)
    like_bookmarks.where(bookmark_id: bookmark.id).first
  end


  def self.from_omniauth(auth)
	  where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
	    user.email = auth.info.email
	    user.password = Devise.friendly_token[0,20]
	    user.name = auth.info.name   # assuming the user model has a name
	    #user.image = auth.info.image # assuming the user model has an image
	  end
	end

  def liked_bookmarks
    like_bookmarks.collect {|like_bookmark| like_bookmark.bookmark} # like_bookmarks.collect(&:bookmark)
  end
end
