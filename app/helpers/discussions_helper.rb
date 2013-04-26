module DiscussionsHelper
  def listing_posts(discussion)
    raise "Empty discussion" if discussion.posts.empty?
    posts = Array.new
    posts.push(discussion.posts.first)

    for i in 1..(APP_CONFIG['posts_per_summarised_discussion'] - 1) do
      posts.insert(1, discussion.posts[-i]) if discussion.posts.size > i
    end
    posts
  rescue Exception => e
    e.to_s
  end
end
