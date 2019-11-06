# frozen_string_literal: true

ActionMailer::Base.smtp_settings = {
  domain: 'bbq-alex.site',
  address: 'smtp.sendgrid.net',
  port: 587,
  authentication: :plain,
  user_name: 'apikey',
  password: Rails.application.credentials.sg_api_key
}