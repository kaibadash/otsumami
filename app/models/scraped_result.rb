# frozen_string_literal: true

class ScrapedResult < ApplicationRecord
  belongs_to :site

  def notify
    SlackService.post(Rails.application.secrets.slack_url, text)
  end
end
