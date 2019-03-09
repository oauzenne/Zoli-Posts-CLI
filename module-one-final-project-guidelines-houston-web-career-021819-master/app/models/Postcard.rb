class Postcard < ActiveRecord::Base
    belongs_to :sender
    belongs_to :receiver
end