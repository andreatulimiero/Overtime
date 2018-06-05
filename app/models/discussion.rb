class Discussion < ActiveRecord::Base
    has_many :comments
    has_many :discussion_upvotes
    has_many :discussion_downvotes

    belongs_to :user

    validates :title, presence: true,
                    length: { minimum: 5 }
end
