class Collaborator < ActiveRecord::Base
  belongs_to :user
  belongs_to :wiki
  validates :user_id, :wiki_id, presence: true

end
