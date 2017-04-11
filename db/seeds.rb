require 'csv'

works = CSV.read("db/media_seeds.csv")[1..-1].map do |line|
  {
    category: line[0],
    title: line[1],
    creator: line[2],
    year_published: line[3],
    description: line[4]
  }
end

work_successes = 0
works.each do |work|
  work = Work.create(work)
  if work.id
    work_successes += 1
  else
    puts "FAILED ON #{work[:title]}"
  end
end

puts "Created #{work_successes} out of #{works.length} works."
