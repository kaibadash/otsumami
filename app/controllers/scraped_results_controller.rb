# frozen_string_literal: true

class ScrapedResultsController < ApplicationController
  include Secured

  def index
    site = Site.new(site_params)
    @results = site.parse(preview: true)
    render json: @results
  end

  private

  def site_params
    params.permit(:url, :css_selector)
  end
end
