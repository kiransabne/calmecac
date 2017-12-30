module ApplicationHelper
  def badge_image_for(user)
    unless user.badges.empty?
      image_tag "#{user.badges.last.name}_red.svg"
    end
  end

  def badge_title_for(user)
    unless user.badges.empty?
      "#{user.badges.last.name.split('_').join(" ").titleize}"
    end
  end
end
