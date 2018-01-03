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

  def student_progress_percentage(user)
    pontuation_information = user.next_badge?(:student)
    100.0 * (pontuation_information[:next_badge_points] - pontuation_information[:points]) / pontuation_information[:next_badge_points]
  end

  def student_progress(user)
    pontuation_information = user.next_badge?(:student)
    pontuation_information[:points]
  end

end
