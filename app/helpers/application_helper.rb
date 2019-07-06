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

    # 引数で与えられたユーザーのidenticon画像を返す
    def identicon_for(user, size = 50)
      identicon_url = "https://identicon-api.herokuapp.com/#{user.created_at} + #{user.id.to_s}/#{size[:size]}?format=png"
      image_tag(identicon_url, alt: user.nickname, class: "gravatar", size: size)
    end

    def profile_icon_tag(user, size = 50)
        if user.avatar.attached?
            image_tag(user.avatar, alt: user.nickname, class: "gravatar", size: size)
        else
            identicon_for(user, size)
        end
    end
end
