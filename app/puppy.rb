class Puppy < ActiveRecord::Base
    belongs_to :dog 
    attr_accessor :owner

    def owner
        dog.owner
    end 
end 