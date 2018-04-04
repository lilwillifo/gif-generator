class CreateGif
  def self.call(category)
    api_instance = GiphyClient::DefaultApi.new
    key = ENV["giphy_api_key"]
    result = api_instance.gifs_random_get(key, {tag: category.name})
    image_path = if result.data
                   result.data.image_url
                 else
                   'https://media.giphy.com/media/3oEjHERaTIdeuFQrXq/giphy.gif'
                 end
    Gif.create(category_id: category.id, image_path: image_path)
  end
end
