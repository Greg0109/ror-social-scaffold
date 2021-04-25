module ApplicationHelper
  def menu_link_to(link_text, link_path)
    class_name = current_page?(link_path) ? 'menu-item active' : 'menu-item'

    content_tag(:div, class: class_name) do
      link_to link_text, link_path
    end
  end

  def like_or_dislike_btn(post)
    like = Like.find_by(post: post, user: current_user)
    if like
      link_to('Dislike!', post_like_path(id: like.id, post_id: post.id), method: :delete)
    else
      link_to('Like!', post_likes_path(post_id: post.id), method: :post)
    end
  end

  # Friendship
  def friend_request_sent?(user)
    current_user.friend_sent.exists?(sent_to_id: user.id, status: false)
  end

  def friend_request_received?(user)
    current_user.friend_request.exists?(sent_by_id: user.id, status: false)
  end

  def possible_friend?(user)
    request_sent = current_user.friend_sent.exists?(sent_to_id: user.id)
    request_received = current_user.friend_request.exists?(sent_by_id: user.id)

    return true if request_sent != request_received
    return true if request_sent == request_received && request_sent == true
    return false if request_sent == request_received && request_sent == false
  end

  def friend?(user)
    return unless current_user != user

    (content_tag :span do
      link_to user.name, user_path(user)
    end) +
      unless possible_friend?(user)
        (content_tag :span do
          link_to ' | Add as friend', user_friendships_path(user), method: :post
        end)
      end
  end

  def display_friends(user)
    link_to user.name, user_path(user) if current_user.friends.include?(user)
  end

  def display_pending(user)
    if friend_request_received?(user) && !current_user.friends.include?(user)
      link_to user.name, user_path(user)
      render 'friendships/decisionModal', object: user
    elsif friend_request_sent?(user) && !current_user.friends.include?(user)
      link_to user.name, user_path(user)
    end
  end
end
