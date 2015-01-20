class Bookmark < ActiveRecord::Base
  belongs_to :user
  belongs_to :topic
  has_many :like_bookmarks
  has_many :users, through: :like_bookmarks

  default_scope { order('updated_at DESC')}

  after_create :set_embedly_url

	def set_embedly_url
    embedly_api = Embedly::API.new :key => ENV['EMBEDLY_API_KEY'],
          :user_agent => 'Mozilla/5.0 (compatible; mytestapp/1.0; my@email.com)'
 
    obj = embedly_api.extract :url => self.url
    # get result and find the attribute for the image
    # set the bookmark's image with that value -- update_attribute(image: val_of_image_from_response)
    o = obj.first
    image = o.images.first

    update_attribute(:image, image['url']) if image && image['url'].present?
    true
  end

end
