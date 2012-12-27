module LessonsHelper

  def signup_link(user, lesson)
    if user.lessons.include?(lesson)
      lesson_user = current_user.lesson_users.where(lesson_id: lesson.id).last
      link_to "Withdraw interest", lesson_user_path(lesson_user),
         class: "lesson_#{lesson.id}", method: :delete, remote: true
    else
      link_to "Sign up to teach section", lesson_users_path(lesson_id: lesson.id), 
        method: :post, action: :create, class: "lesson_#{lesson.id}", remote: true   
    end
  end

  def display_classes(lessons, track)
    links = ""
    lessons.each do |lesson|
      if lesson.tracks.include?(track)
        links.concat link_to lesson.summary, "#modal_#{lesson.id}", class: "btn btn-block btn-primary",
          data: { toggle: 'modal' }
        links.concat "<br>"
      end
    end
    links.html_safe
  end

  def admin_display_classes(lessons, track)
    links = ""
    lessons.each do |lesson|
      if lesson.tracks.include?(track)
        links.concat link_to lesson.summary, [:admin, lesson], class: "lesson_#{lesson.id}"
        links += " | "
        links.concat link_to "delete ", [:admin, lesson], class: "lesson_#{lesson.id}",
          method: :delete, confirm: "Are you sure?", remote: true  
        links += "(#{lesson.users.count})"  
      end
    end
    links.html_safe
  end

  # def build_admin_table_body(semester, num_days)
  #   table_body = ''
  #   num_days.times do |day|
  #     table_body += '<tr>'
  #     table_body += td_for_admin(semester.lesson_tracks.)

  #   end
  #   table_body.html_safe
  # end

  # def lesson_link(lessons)
  #   links = ''
  #   if lessons.any?
  #     lessons.each do |lesson|
  #       links.concat link_to lesson.summary, lesson
  #       links.concat '<br>'
  #     end
  #   end
  #   links.html_safe
  # end

  # def lesson_or_create_link(lesson_day, track_id)
  #   lessons = lesson_day.lessons
  #   link_string = ''
  #   lessons.each do |lesson|
  #     tracks = lesson.tracks
  #     if tracks.map(&:id).include?(track_id)
        
  #     end
  #     link_string.concat "<div id='lesson_#{lesson.id}'>"
  #     link_string.concat( link_to lesson.summary, [:admin, lesson], 
  #        class: "lesson_link" )
  #     link_string.concat link_to "  (delete)", admin_lesson_path(lesson), method: :delete,
  #       id: "delete_#{lesson.id}", confirm: "Confirm deletion", remote: true  
  #     link_string.concat "<br></div>"
  #   end
  #   link_string.concat link_to "(add new)", 
  #     new_admin_lesson_path(track_id: track_id, lesson_day_id: lesson_day.id)
  #   link_string.html_safe
  # end
end
