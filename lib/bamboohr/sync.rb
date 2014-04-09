module BambooHR
  class Sync
    def self.users
      users = client.employee_list
      users["employees"].each do |data|
        create_user(data)
      end
    end

    def self.create_user(data)
      if data["workEmail"]
        user = User.find_by_email(data["workEmail"]) || User.new
        user.name = data["displayName"]
        user.email = data["workEmail"]
        user.department = data["department"]
        user.password = generate_password
        user.password_confirmation = user.password

        user.save
      end
    end

    def self.generate_password
      Time.now.to_i
    end

    def self.client
      unless @client
        @client = Client.new
        @client.key = ENV['BAMBOO_API_KEY']
        @client.subdomain = ENV['BAMBOO_SUBDOMAIN']
      end
      @client
    end
  end
end
