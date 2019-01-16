module ApplicationHelper
    def app_url
        ENV['APP_URL'] || ""
    end

    def app_name
        ENV['APP_NAME'].dup.force_encoding('UTF-8') || ""
    end

    def logged_in?
        current_user ? true : false
    end
end
