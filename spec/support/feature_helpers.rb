module FeatureHelpers
  def login_with_oauth(service = :google_oauth2)
    visit "/users/auth/#{service}"
  end
end
