require 'set'
class Jaccard
  def self.coefficient(a, b)
    intersection = a & b
    union = a + b
    union.uniq! if union.respond_to?(:uniq!)
    intersection.length.to_f / union.length.to_f
  end

  def self.distance(a, b)
    1.0 - coefficient(a, b)
  end

  def self.closest_to(a, others)
    others.inject([2.0, nil]) do |memo, other|
      dist = distance(a, other)
      next memo if memo.first < dist
      [dist, other]
    end
  end

  def self.best_match(items)
    seen = Set.new
    matches = []
    items.each do |row|
      items.each do |col|
        next if row == col
        next if seen.include?([row, col]) || seen.include?([col, row])
        seen << [row, col]
        matches << [distance(row, col), [row, col]]
      end
    end

    matches.sort.first.last
  end
end
