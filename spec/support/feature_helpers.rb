module FeatureHelpers
  def login_with_oauth(service = :google_apps)
    visit "/users/auth/#{service}"
  end
end
