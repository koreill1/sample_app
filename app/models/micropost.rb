class Micropost < ActiveRecord::Base
  attr_accessible :content
  
  belongs_to :user
  
  validates :content, :presence=>true, :length=>{:maximum => 140}
  validates :user_id, :presence=>true
  
  default_scope :order => 'microposts.created_at DESC'
    

private

  def self.from_users_followed_by(user)
    followed_ids = user.following.map(&:id) + [user.id]
    where(:user_id => followed_ids)
  end

end
