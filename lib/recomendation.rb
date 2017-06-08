require 'jaccard'
def give_recommendations(username, preferences, weights)
  preference = preferences[username]
  rank = Hash.new
  preferences.each do |user_other,preference_other|
    if username != user_other

      similarity = jaccard_index(preference, preference_other)
      if !similarity
        next
      end

      preference_other.each do |movie|
        if movie != preference
          rank.setdefault(movie, 0)
          rank[movie] += similarity
        end
      end
    end
    puts similarity
    ## TODO:
    # return
  end
