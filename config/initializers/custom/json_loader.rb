breeds_json_path = Rails.root.join('config', 'initializers', 'json_data', 'breeds.json')
breeds_json_file = File.read(breeds_json_path)
breeds_hash = JSON.parse(breeds_json_file)

normalized_breeds_data = []

breeds_hash["message"].each do |breed_element|
  if breed_element.second.any?
    breeds_combinations = breeds_hash["message"][breed_element.first].map{|breed| "#{breed_element.first}/#{breed}"}
    normalized_breeds_data.push(*breeds_combinations)
  else
    normalized_breeds_data.push(breed_element.first)
  end
end

BREEDS_DATA = normalized_breeds_data.freeze
