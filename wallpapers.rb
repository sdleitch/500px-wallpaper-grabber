require 'f00px'
require 'json'
require 'open-uri'

# Setup F00px
F00px.configure do |config|
  config.consumer_key = YOUR_CONSUMER_KEY
  config.consumer_secret = YOUR_CONSUMER_SECRET
end

def get_new_wallpapers(pic_array, min_width)
  to_write = []
  pic_array.each do |pic|
    # If photo width is larger the min_width (screen width), put it in an array to be saved
    to_write << pic if (pic['width'] >= min_width) && (pic['width'] > pic['height']) && (pic['height'] > min_width * 1.6)
  end
  if to_write.length != 0
    # Delete current photos
    Dir.foreach('wallpapers/') {|f| fn = File.join('wallpapers/', f); File.delete(fn) if f != '.' && f != '..'}
    # Save the new photos
    to_write.each { |pic| File.write("wallpapers/#{pic['id']}.jpg", open(pic['image_url']).read) }
  end
end

# Make call to get response, parse to JSON, strip to just photo array
response = F00px.get('photos?feature=popular&image_size=6')
parsed_response = (JSON.parse(response.body))
pics = parsed_response['photos']

get_new_wallpapers(pics, 1680) # Run it.
