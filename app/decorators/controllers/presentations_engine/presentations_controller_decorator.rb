PresentationsEngine::PresentationsController.class_eval do
  def index
    @presentations =
      if params[:filter]
        PresentationsEngine::Presentation.
          where("date = ?", params[:filter].to_date).order('date')
      elsif params[:search]
        PresentationsEngine::Presentation.joins(:user).
          where("presentations_engine_presentations.title ILIKE ? OR
          users.name ILIKE ?", "%#{params[:search]}%",
          "%#{params[:search]}%")
      else
        PresentationsEngine::Presentation.all
      end
  end
end
