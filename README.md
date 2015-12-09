# 500px-wallpaper-grabber
A quick script to grab new desktop wallpapers from the current popular 500px photos

Requires the F00px gem, so...
```bash
gem install f00px
```
...then, add your key and secret,
```ruby
F00px.configure do |config|
  config.consumer_key = YOUR_CONSUMER_KEY
  config.consumer_secret = YOUR_CONSUMER_SECRET
end
```
And run the script.
