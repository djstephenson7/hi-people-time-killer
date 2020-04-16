# frozen_string_literal: true

# require 'hipeoplechallenge/version'
require 'HTTParty'
require 'Nokogiri'
require 'JSON'
require 'Pry'
require 'open-uri'
require 'mini_magick'

# module Hipeoplechallenge
#   class Error < StandardError; end
#   class WebScraper

#     def initialize
storage = []
thumbnails = []
@uri
#   end

#   def get_data
URL = 'https://www.freeimages.com/'
page = HTTParty.get('https://www.freeimages.com/')
parse_page = Nokogiri::HTML(open(URL)).xpath('//img/@src').each do |src|
  @uri = URI.join(URL, src).to_s
  storage.push(@uri)
end

something = storage.each do |x|
  image = MiniMagick::Image.open(x)
  image.resize '100x100'
  thumbnails.push(image)
end

thumbnails.each do |image|
  p image.dimensions
end
Pry.start(binding)
#   end

#   end
# end
