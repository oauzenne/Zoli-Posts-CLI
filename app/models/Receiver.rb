class Receiver < ActiveRecord::Base
    has_many :postcards
    has_many :senders, through: :postcards
end