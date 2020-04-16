# frozen_string_literal: true

require 'Nokogiri'
require 'mini_magick'

class WebScraper
  def initialize(url)
    @storage = []
    @thumbnails = []
    @url = url
  end

  def scrape_data
    Nokogiri::HTML(open(@url)).xpath('//img/@src').each do |src|
      uri = URI.join(@url, src).to_s
      @storage.push(uri)
    end
  end

  def to_thumbnail
    @storage.each do |file|
      image = MiniMagick::Image.open(file).resize '100x100'
      @thumbnails.push(image)
    end
  end
end
