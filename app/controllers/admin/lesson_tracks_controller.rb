class Admin::LessonTracksController < Admin::BaseController

  def create
    @semester = Semester.find(params[:semester_id])
    @lesson_track = @semester.lesson_tracks.new
    @lesson_track.day_value = params[:lesson_track][:day_value]
    @lesson_track.save!
  end

  def update
    @lesson_track = LessonTrack.find(params[:id])
    @lesson_track.day_value = params[:lesson_track][:day_value]
    @lesson_track.save!
  end

  def destroy
    @lesson_track = LessonDay.find(params[:id])
    @lesson_track.destroy
  end

end