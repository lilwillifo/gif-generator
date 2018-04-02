class CreateGif
  def self.call(category)
    api_instance = GiphyClient::DefaultApi.new
    key = ENV["giphy_api_key"]
    result = api_instance.gifs_random_get(key, {tag: category.name})
    Gif.create(category: category, image_path: result.data.image_url)
  end
end
