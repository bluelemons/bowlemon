class Player
  include DataMapper::Resource
  property :id, Serial
  property :name, String
  #property :body, Text
  #property :created_at, DateTime

  has n, :scores
  has n, :games, model: 'Game', child_key: [:id], parent_key: [:game_id], :through => :scores

  def current_score
    binding.pry
    scores
  end

end

# Perform basic sanity checks and initialize all relationships
# Call this when you've defined all your models
