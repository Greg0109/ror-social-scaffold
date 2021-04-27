class Friendship < ApplicationRecord
  belongs_to :sent_to, class_name: :User, foreign_key: :sent_to_id
  belongs_to :sent_by, class_name: :User, foreign_key: :sent_by_id
  scope :friends, -> { where(status: true) }
  scope :not_friends, -> { where(status: false) }

  def self.accepted_friend(current_user, user_id)
    @friendship = Friendship.find_by(sent_by_id: user_id, sent_to_id: current_user.id, status: false)
    return unless @friendship # return if no record is found

    @friendship.status = true
    @friendship.save
    @friendship2 = current_user.friend_sent.build(sent_to_id: user_id, status: true)
    @friendship2.save
  end

  def self.declined_friend(current_user, user_id)
    @friendship = Friendship.find_by(sent_by_id: user_id, sent_to_id: current_user.id, status: false)
    return unless @friendship # return if no record is found

    @friendship.destroy
  end
end
