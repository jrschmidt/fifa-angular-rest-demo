json.array!(@matches) do |match|
  json.extract! match, :id, :team1_id, :team2_id, :match_date, :score1, :score2
  json.url match_url(match, format: :json)
end
