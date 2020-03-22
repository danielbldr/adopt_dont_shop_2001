# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

shelter1 = Shelter.create(name: "Humane Society of Boulder Valley",
                          address: "2323 55th St",
                          city: "Boulder",
                          state: "CO",
                          zip: "80301")
shelter2 = Shelter.create(name: "Longmont Humane Society",
                          address: "9595 Nelson Rd",
                          city: "Longmont",
                          state: "CO",
                          zip: "80501")
pet1 = Pet.create(image: 'https://www.akcdoublebgoldens.com/wp-content/uploads/2018/05/Ignite-1.jpg',
                name: 'Kahlua',
                age: '4',
                sex: 'Female',
                shelter: shelter1,
                description: "Kahlua is an English Cream Golden Retriever. She loves kids and wants to be with an active family.",
                adoption_status: "Available")
pet2 = Pet.create(image: 'https://petdt.com/wp-content/uploads/2017/12/mini-goldendoodle-outside.jpg',
                  name: 'Luna',
                  age: '2',
                  sex: 'Female',
                  shelter: shelter2,
                  description: "Luna is a Mini Goldendoodle. She loves treats, walks, and chasing squirrels.",
                  adoption_status: "Available")
