require 'csv'

works_array = []
CSV.read("db/media_seeds.csv", headers: true).map do |line|
  work = {
    category: line[1],
    name: line[2],
    created_by: line[3],
    pub_year: line[4],
    desc: line[5]
  }
  works_array << work
end

works_array.each do |work|
  new_work = Work.create(work)
  if !new_work.id
    puts "couldn't create work #{work.name}"
  end
end
