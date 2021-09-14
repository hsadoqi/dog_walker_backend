# require 'pry'
Owner.destroy_all
Dog.destroy_all

bob = Owner.create(name: "Bob")
Owner.create(name: "Joe")
Owner.create(name: "Susan")
Owner.create(name: "John")
Owner.create(name: "Leroy")

bob.dogs.create(name: "Bowie")
Dog.create(name: "Louie", owner_id: Owner.all.sample.id)
Dog.create(name: "Butch", owner_id: Owner.all.sample.id)
Dog.create(name: "Hazel", owner_id: Owner.all.sample.id)

# binding.pry