WorkshopsEngine::WorkshopsController.class_eval do
   def update
      if @workshop.update(workshop_params)
      	if workshop_params[:is_published]
      	  WorkshopNotificationMailer.workshop_notification(
            current_user, all_emails
          ).deliver
        end  
        redirect_to workshops_url, notice: 'Workshop was successfully updated.'
      else
        render :edit
      end
    end
end