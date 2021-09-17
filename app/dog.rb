class Dog < ActiveRecord::Base
    belongs_to :owner
    has_many :puppies
end 