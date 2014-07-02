class Wiki < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: [:slugged, :history]
  belongs_to :user
  has_many :collaborators
  has_many :users, through: :collaborators
  scope :visible_to, -> { where(public: true) }
  scope :member, -> { where(public: false) }
  def collaborate
    emails = []
    self.collaborators.each do |user| 
      emails << User.find(user.user_id).email
    end
    emails
  end
  def should_generate_new_friendly_id?
    new_record?
  end

end
