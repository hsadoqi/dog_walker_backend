class Owner < ActiveRecord::Base
    has_many :dogs
    has_many :puppies, through: :dogs
end 