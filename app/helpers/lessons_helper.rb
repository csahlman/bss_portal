module LessonsHelper

  def create_modals(lessons, semester)
    html_to_return = ""
    lessons.each do |lesson|
      html_to_return += '<div id="modal_' + lesson.id.to_s + '" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">'
      html_to_return += '<div class="modal-header">'
        # html_to_return += '<h1>Being taught by ' + format_users(lesson.teachers) + '</h1>'
      html_to_return += '<h3>' + lesson.title + '</h3></div>'
      # html_to_return += '</div>'
      html_to_return += '<div class="modal-body">'
      html_to_return += '<p>' + lesson.overview + '</p>'
      html_to_return += '</div>'
      html_to_return += '<div class="modal-footer">'
      html_to_return += link_to("Learn More", [semester, lesson], class: 'btn btn-primary') 
      html_to_return += link_to("Sign up to teach", signups_path(lesson_id: lesson.id, semester_id: semester.id), class: 'btn btn-success', method: :post)
      html_to_return += '<button class="btn" data-dismiss="modal" aria-hidden="true">Close</button></div></div>'
    end
    raw html_to_return.html_safe
  end


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
      lesson.tracks.count > 1 ? css_class = "btn-success" : css_class = "btn-primary"
      lesson.assigned? ? css_class = "btn-danger" : css_class
      if lesson.tracks.include?(track)
        links.concat link_to (truncate lesson.title, length: 30, omission: '...'), 
          "#modal_#{lesson.id}", class: "btn btn-block #{css_class}",
          data: { toggle: 'modal' }
        links.concat "<br>"
      end
    end
    links.html_safe
  end

  def admin_display_classes(lessons, track, semester)
    links = ""
    lessons.each do |lesson|
      if lesson.tracks.include?(track)
        links.concat link_to lesson.title, admin_lesson_path(lesson), 
          class: "lesson_#{lesson.id}"
        links += " | "
        links.concat link_to "delete ", [:admin, lesson], class: "lesson_#{lesson.id}",
          method: :delete, confirm: "Are you sure?", remote: true  
        links += link_to("(#{lesson.users.count})", admin_users_path(lesson_id: lesson.id)) 
        links += '<br>'
      end
    end
    # links += link_to "Add from template", new_admin_lesson_template_path(semester_id: semester.id)
    links.html_safe
  end

  def admin_signups_link(user, lesson)
    link = ""
    if user.assigned_to_teach?(lesson)
      link += link_to "Unassign this User", admin_signup_path(lesson, user_id: user.id,
        lesson_id: lesson.id), id: "assign_#{user.id}", method: :delete, 
        confirm: "Are you sure?", remote: true
    else
      link += link_to "Assign User This Class", admin_signups_path(user_id: user.id,
        lesson_id: lesson.id), id: "assign_#{user.id}", method: :post, 
        confirm: "Are you sure? This will send an email", remote: true
    end
    link.html_safe
  end

  def track_names lesson_template
    tracks = ""
    lesson_template.tracks.each do |track|
      tracks += "#{track.name} "
    end
    tracks
  end

  def default_link lesson_template
    if lesson_template.default?
      link_to "Remove Default", toggle_default_admin_lesson_template_path(lesson_template),
        id: "toggle_#{lesson_template.id}", method: :post, remote: true 
    else
      link_to "Make Default", toggle_default_admin_lesson_template_path(lesson_template),
        id: "toggle_#{lesson_template.id}", method: :post, remote: true
    end
  end

  def increment_link(type, id, lesson_template_id)
    link_to '(+)', admin_increment_list_path(list_type: type, id: id, 
      lesson_id: lesson_template_id), method: :post
  end

  def decrement_link(type, id, lesson_template_id)
    link_to '(-)', admin_decrement_list_path(list_type: type, id: id, 
      lesson_id: lesson_template_id), method: :post
  end

  def confirmation_link lesson_user
    li_to_append = '<li id="lesson_user_' + lesson_user.id.to_s + '">'
    li_to_append += link_to lesson_user.lesson.to_s, [:admin, lesson_user.lesson]
    li_to_append += " | "
    if lesson_user.confirmed?
      li_to_append += link_to "Unassign", withdrawals_path(user_id: lesson_user.user_id, 
        lesson_id: lesson_user.lesson_id), class: "btn btn-small btn-danger",
        method: :post, confirm: "This will send an email", remote: true
    else
      li_to_append += link_to "Manually Confirm", confirmations_path(user_id: lesson_user.user_id, 
        lesson_id: lesson_user.lesson_id), class: "btn btn-small btn-danger",
        method: :post, confirm: "This will send an email", remote: true
    end
    li_to_append += " | "
    li_to_append += link_to "Remove From User", admin_signup_path(lesson_user, 
      user_id: lesson_user.user_id, lesson_id: lesson_user.lesson_id), method: :delete, 
      class: "btn btn-success btn-small", confirm: "Are you sure?", remote: true
    li_to_append += '</li>'
    li_to_append.html_safe
  end

end
