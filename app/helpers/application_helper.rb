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

    # 引数で与えられたユーザーのGravatar画像を返す
    def gravatar_for(user, size = 50)
      gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
      gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
      image_tag(gravatar_url, alt: user.name, class: "gravatar", size: size)
    end
end
