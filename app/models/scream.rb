class Scream < ActiveRecord::Base
  attr_accessible :body, :media_url, :owner, :provider, :owner_media_url, :tag

  def self.all_content_providers tag
    (Scream.all + twitter_feed(tag) + instagram_feed(tag)).shuffle
  end

  def self.instagram_feed tag
    results = Instagram.tag_recent_media(tag)
    screams = Array.new()
    results.each do |insta|
      screams << Scream.new(body: (insta.caption.text if insta.caption), owner: (insta.caption.from.username if insta.caption), media_url: insta.images.standard_resolution.url, provider: 'Instagram', tag: tag, owner_media_url: (insta.caption.from.profile_picture if insta.caption))
    end   
    screams
  end

  def self.twitter_feed tag
    results = TC.search("##{tag}", :count => 20, :result_type => "recent", include_entities: true).results
    screams = Array.new()
    results.each do |tweet|
      screams << Scream.new(body: tweet.text, owner: tweet.user.screen_name, media_url: "", provider: 'Twitter', tag: tag, owner_media_url: tweet.user.profile_image_url)
    end
    screams
  end

  def self.facebook_feed tag
    @graph = Koala::Facebook::API.new()
    results = @graph.search("##{tag}")
    screams = Array.new()
    results.each do |face|
      screams << Scream.new(body: face["message"], owner: face["from"]["name"], provider: 'Facebook', tag: tag)
    end
    screams
  end
end
