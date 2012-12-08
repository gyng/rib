module DiscussionsHelper
  def listing_posts(discussion)
    raise "Empty discussion" if discussion.posts.empty?
    posts = Array.new
    posts.push(discussion.posts.first)
    posts.push(discussion.posts[-2]) if discussion.posts.size > 2
    posts.push(discussion.posts[-1]) if discussion.posts.size > 1
    posts
  rescue Exception => e
    e.to_s
  end
end
