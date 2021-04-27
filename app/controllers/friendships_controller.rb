class FriendshipsController < ApplicationController
  include ApplicationHelper

  def create
    return if current_user.id == params[:user_id] # Disallow the ability to send yourself a friend request
    # Disallow the ability to send friend request more than once to same person
    return if friend_request_sent?(User.find(params[:user_id]))
    # Disallow the ability to send friend request to someone who already sent you one
    return if friend_request_received?(User.find(params[:user_id]))

    @user = User.find(params[:user_id])
    @friendship = current_user.friend_sent.build(sent_to_id: params[:user_id])
    if @friendship.save
      flash[:success] = 'Friend Request Sent!'
    else
      flash[:danger] = 'Friend Request Failed!'
    end
    redirect_back(fallback_location: root_path)
  end

  def accept_friend
    Friendship.accepted_friend(current_user, params[:user_id])
    flash[:success] = 'Friend Request Accepted!'
    redirect_back(fallback_location: root_path)
  end

  def decline_friend
    Friendship.declined_friend(current_user, params[:user_id])
    flash[:success] = 'Friend Request Declined!'
    redirect_back(fallback_location: root_path)
  end
end
