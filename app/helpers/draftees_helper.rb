module DrafteesHelper

  def image_link_to_media(social_media, input)
    media = {"twitter" => "https://twitter.com", "instagram" => "https://instagram.com"}
    media_link = media[social_media] + '/' + input
    return link_to(image_tag("social_media_icons/" + social_media + ".png", alt: "Twitter", size: "72x72"), media_link) if not input.empty? 
  end

end
