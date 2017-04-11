# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

submissions = [
     {
          category: "Movie",
          author: "George Lucas",
          title: "Empire Strikes Back"
     },
     {
           category: "Album",
           author: "Prince",
           title: "Purple Rain"
     },
     {
          category: "Book",
          author: "Conn Iggulden",
          title: "Lords of the Bow"
     }
]

submissions.each do | submission |
  Submission.create(submission)
end

users = [
     {
          username: "Princess",
          status: true
     },
     {
           username: "Darth",
           status: false
     },
     {
          username: "Han",
          status: true
     }
]

users.each do | user |
  User.create(user)
end

sf = Submission.first
uf = User.first
sl = Submission.last
ul = User.last

votes = [
     {
          submission: sf,
          user: uf
     },
     {
          submission: sl,
          user: ul
     },
]

votes.each do | vote |
  Vote.create(vote)
end
