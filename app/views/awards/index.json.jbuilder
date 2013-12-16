json.array!(@awards) do |award|
  json.extract! award, :user_id, :award_giver_name, :award_link, :accepted
  json.url award_url(award, format: :json)
end