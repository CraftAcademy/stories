json.new_notification_count @new_notification_count
json.next_page @notifications.next_page
json.notifications do |json|
  json.array! @notifications do |notification|
    json.id notification.id
    json.actor notification.actor.username
    json.actor.isVerifiedMember notification.actor.verified_member?
    json.actor_avatar_img_tag avatar_for(notification.actor, size: 35)
    json.action notification.action

    json.type notification.notifiable.class.to_s.underscore.humanize.downcase
    json.type_humanized notification.notifiable_humanized


    json.url case notification.notifiable.class.to_s
            when "Post" then post_path(notification.notifiable)
            when "User" then user_path(notification.notifiable)
            when "Response" then post_path(notification.notifiable.post, anchor: "response_#{notification.notifiable.id}")
            end
    json.time_ago time_ago_in_words(notification.created_at) + " #{t('application.ago')}"
    json.unread notification.read_at.nil?
  end
end
