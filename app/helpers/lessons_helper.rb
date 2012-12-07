module LessonsHelper

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
