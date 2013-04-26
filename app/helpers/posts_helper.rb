module PostsHelper
  # http://stackoverflow.com/questions/5909121/converting-a-regular-youtube-link-into-an-embedded-video
  def youtube_embed(youtube_url)
    if youtube_url[/youtu\.be\/([^\?]*)/]
      youtube_id = $1
    else
      # Regex modified from # http://stackoverflow.com/questions/3452546/javascript-regex-how-to-get-youtube-video-id-from-url/4811367#4811367
      youtube_url[/\S*youtu\S*((v\/)|(embed\/)|(watch\?))\??v?=?([^\&\? \n]*)/]
      youtube_id = $5
    end

    return nil if youtube_id.nil?
    %Q{<iframe title="YouTube video player" width="100%" height="380px" src="http://www.youtube.com/embed/#{ youtube_id }" frameborder="0" allowfullscreen></iframe>}
  end
end
