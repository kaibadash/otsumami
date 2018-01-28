# frozen_string_literal: true

require "open-uri"

class Site < ApplicationRecord
  has_many :scraped_results

  def parse
    dom = Nokogiri::HTML(open(url).read)
    items = dom.css(css_selector)
    items.each do |d|
      ScrapedResult.find_or_create_by!(site: self, text: d.text.strip.delete("\t"))
    end
  end
end
