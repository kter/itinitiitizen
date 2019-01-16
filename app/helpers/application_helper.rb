module ApplicationHelper
    def app_url
        ENV['APP_URL'] || ""
    end

    def app_name
        ENV['APP_NAME'].dup.force_encoding('UTF-8') || ""
    end
end
