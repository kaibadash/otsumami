# frozen_string_literal: true

json.extract! site, :id, :created_at, :updated_at
json.url site_url(site, format: :json)
