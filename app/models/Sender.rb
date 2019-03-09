class Sender < ActiveRecord::Base
    has_many :postcards
    has_many :receivers, through: :postcards
    #safter_initialize :init

    #def init
     #   self.balance ||= 5.0
    #end

    
end