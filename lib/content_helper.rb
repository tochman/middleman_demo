require 'open-uri'
require 'nokogiri'
require 'mechanize'

module ContentHelper
  def scrape_curriculum
    site_url = 'https://www.craftacademy.se/english/curriculum/'
    agent = Mechanize.new
    page = agent.get(site_url)
    weeks = page.search('.category')
    content = []
    weeks.each do |week|
      hash = {
          header: week.search('h4').text,
          sub_header: week.search('dt').text,
          body: week.search('dd p').text
      }
      content.push(hash)
    end
    content
  end
end