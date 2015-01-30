module PresentationsEngine
  class ApplicationController < ::ApplicationController
    if Rails.env.test?
      layout 'dummy'
    else
      layout 'admin'
    end
  end
end
