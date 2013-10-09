class Vceste
  include HTTParty
  base_uri "http://www.25este75sur.com/api/"

  def self.get_category_posts(options)
    posts = []
    response = self.get("/get_category_posts", query: options)
    for post in response["posts"] do
      posts.push Event.new(body: post["content"], name: post["title"], date: post["date"])
    end
    posts
  end
end