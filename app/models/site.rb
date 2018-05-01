# frozen_string_literal: true

require "open-uri"

class Site < ApplicationRecord
  has_many :scraped_results
  belongs_to :user

  def parse(preview: false)
    # TODO: Cache results
    dom = Nokogiri::HTML(open(url).read)
    items = dom.css(css_selector)
    results = []
    items.each do |d|
      res = ScrapedResult.find_or_initialize_by(site: self, text: d.text.strip.delete("\t"))
      results.append(res)
      next if preview
      res.notify if res.new_record?
      res.save!
    end

    results
  end
end
