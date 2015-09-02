module DrafteesHelper

  # return twitter profile picture if draftee has twitter 
  def twitter(draftee)
    # image_tag(twitter, alt: user.name, class: "gravatar")
    image_tag("social_media_icons/twitter.png", alt: "Twitter", size: "72x72")
  end

  # return instagram profile picture if draftee has instagram
  def instagram(draftee)
    # image_tag(gravatar_url, alt: user.name, class: "gravatar")
    image_tag("social_media_icons/instagram.png", alt: "Instagram", size: "72x72")
  end

end
