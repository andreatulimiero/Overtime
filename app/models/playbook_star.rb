class PlaybookStar < ActiveRecord::Base
    belongs_to :playbook
    belongs_to :user
end
