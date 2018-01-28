# frozen_string_literal: true

namespace :scraping do
  desc "scraping sites"
  task all: :environment do
    Site.all.each(&:parse)
  end
end
