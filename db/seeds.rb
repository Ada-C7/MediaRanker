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
     },
     {
          category: "Movie",
          author: "James Cameron",
          title: "Terminator"
     },

     {
           category: "Album",
           author: "Duke Ellington",
           title: "Mood Indigo"
     },
     {
          category: "Book",
          author: "Ken Follett",
          title: "Pillars of the Earth"
     },
     {
          category: "Movie",
          author: "Paul Verhoeven",
          title: "Total Recall"
     },

     {
           category: "Album",
           author: "Ella Fitzgerald & Louis Armstrong",
           title: "The Complete Ella Fitzgerald & Louis Armstrong"
     },
     {
          category: "Book",
          author: "James A. Michener",
          title: "Hawaii"
     }
]

submissions.each do | submission |
  Submission.create(submission)
end

users = [
     {
          username: "Princess",
     },

     {
           username: "Darth",
     },

     {
          username: "Han",
     },

     {
          username: "Chewy",
     },

     {
           username: "Luke",
     },

     {
          username: "R2-D2",
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

     {
          submission: sf,
          user: uf
     },

     {
          submission: sl,
          user: ul
     },

     {
          submission: sf,
          user: uf
     },

     {
          submission: sl,
          user: ul
     },

     {
          submission: sf,
          user: uf
     },

     {
          submission: sf,
          user: ul
     },

     {
          submission: sl,
          user: uf
     },

     {
          submission: sf,
          user: ul
     },
     {
          submission: sl,
          user: uf
     },

     {
          submission: sf,
          user: ul
     },

     {
          submission: sl,
          user: uf
     },
]


votes.each do | vote |
  Vote.create(vote)
end
