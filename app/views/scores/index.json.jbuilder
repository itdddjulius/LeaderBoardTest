json.array!(@scores) do |score|
  json.extract! score, :id, :name, :points
  json.url score_url(score, format: :json)
end
