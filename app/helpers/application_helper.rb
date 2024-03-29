module ApplicationHelper
  def bootstrap_class_for(flash_type)
    case flash_type
      when "success"
        "alert-success"   # Green
      when "error"
        "alert-danger"    # Red
      when "alert"
        "alert-warning"   # Yellow
      when "notice"
        "alert-info"      # Blue
      else
        flash_type.to_s
    end
  end

  def icon(shape)
    "<span class='glyphicon glyphicon-#{shape}'></span>".html_safe
  end

  def active_menu(target_controller)
    "class=#{controller_name == target_controller ? 'active' : ''}"
  end

  def user_email(post)
    post.user.present? ? post.user.email : "an anonymous user"
  end


  def link_to_provider(user)
    provider = user.identities.map(&:provider).join(', ')
    provider = case provider
    when 'facebook' then link_to( 'Go to Facebook', "http://www.facebook.com" )
    when "twitter" then link_to( 'Go to Twitter', "http://twitter.com" )
    when "linkedin" then link_to( 'Go to Linkedin', "http://linkedin.com" )
    when "google_oauth2" then link_to( 'Go to Google+', "plus.google.com" )
    end

  end
end
