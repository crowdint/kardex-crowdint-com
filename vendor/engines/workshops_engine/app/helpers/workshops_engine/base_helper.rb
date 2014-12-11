module WorkshopsEngine
  module BaseHelper
    def workshops_admin
      Role.find_by_name('workshops admin')
    end

    def show_public_workshops(active)
      if active
        show_active_published_workshops
      else
        show_published_workshops
      end
    end

    def show_active_published_workshops
      if @workshops.active.published
        render partial: 'workshops_list', locals:
          { workshops: @workshops.published.active }
      else
        render 'workshops_engine/shared/default_workshop_message'
      end
    end

    def show_published_workshops
      if @workshops.published
        render partial: 'workshops_engine/workshops/workshops_list', locals:
          { workshops: @workshops.published }
      else
        render 'workshops_engine/shared/default_workshop_message'
      end
    end

    def show_last_active_published_workshop
      if WorkshopsEngine::Workshop.active.published.last
        render partial: 'workshops_engine/shared/workshop', locals: { workshop:
          WorkshopsEngine::Workshop.active.published.last }
      else
        render 'workshops_engine/shared/default_workshop_message'
      end
    end

    def show_workshop_month
      if WorkshopsEngine::Workshop.all.active.published.last
        if WorkshopsEngine::Workshop.all.active.published.last.date_and_time
          WorkshopsEngine::Workshop.all.active.published.
            last.date_and_time.strftime("%B")
        end
      end
    end
  end
end
