# frozen_string_literal: true
# require 'hipeoplechallenge/version'
require 'HTTParty'
require 'Nokogiri'
require 'JSON'
require 'Pry'
require 'open-uri'

# module Hipeoplechallenge
#   class Error < StandardError; end
#   class WebScraper

#     def initialize
#       @storage = []
#   end

#   def get_data
  URL = 'https://www.freeimages.com/'
    page = HTTParty.get('https://www.freeimages.com/')
    parse_page = Nokogiri::HTML(open(URL)).xpath("//img/@src").each do |src|
      uri = URI.join( URL, src ).to_s
      File.open(File.basename(uri),'wb'){ |f| f.write(open(uri).read) }
    end

    Pry.start(binding)
#   end

#   end
# end
