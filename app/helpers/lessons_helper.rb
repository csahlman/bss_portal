module LessonsHelper

  def lesson_link(lesson)
    if lesson
      link_to lesson.summary, [lesson.track, lesson]
    end
  end

  def lesson_or_create_link(lesson_day, track_id)
    lesson = lesson_day.lessons.where(track_id: track_id).last
    if lesson
      link_to lesson.summary, [:admin, lesson], class: "lesson_link"
    else
      link_to "Create new template", new_admin_lesson_path(track_id: track_id, lesson_day_id: lesson_day.id)
    end
  end
end
