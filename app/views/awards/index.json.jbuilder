json.array!(@awards) do |award|
  json.extract! award, :userid, :awardGiverName, :awardLink, :accepted
  json.url award_url(award, format: :json)
end