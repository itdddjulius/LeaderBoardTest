class Game < ActiveRecord::Base
    has_many :scores
    validates :title, presence: true
end
