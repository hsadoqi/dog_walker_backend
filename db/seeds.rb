Owner.destroy_all
Dog.destroy_all
Puppy.destroy_all

bob = Owner.create(name: "Bob")
Owner.create(name: "Joe")
Owner.create(name: "Susan")
Owner.create(name: "John")
Owner.create(name: "Leroy")

bob.dogs.create(name: "Bowie", breed: "Good girl")
Dog.create(name: "Louie", owner_id: Owner.all.sample.id, breed: "Golden Retriever")
Dog.create(name: "Butch", owner_id: Owner.all.sample.id, breed: "Poodle")
Dog.create(name: "Hazel", owner_id: Owner.all.sample.id, breed: "Beagle")

Puppy.create(name: "Louie", dog_id: Dog.all.sample.id, breed: "Golden Retriever")
Puppy.create(name: "L", dog_id: Dog.all.sample.id, breed: "Golden")
Puppy.create(name: "Lo", dog_id: Dog.all.sample.id, breed: "Golden Doodle")
Puppy.create(name: "Lou", dog_id: Dog.all.sample.id, breed: "Golden Retriever")
Puppy.create(name: "Loui", dog_id: Dog.all.sample.id, breed: "Golden Retriever")
Puppy.create(name: "Louise", dog_id: Dog.all.sample.id, breed: "Golden Retriever")

# binding.pry