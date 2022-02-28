# frozen_string_literal: true

ActionMailer::Base.smtp_settings = {
  address:  Rails.application.credentials.mail_address,
  port: Rails.application.credentials.mail_port,
  domain: 'bbqv2.herokuapp.com',
  user_name: Rails.application.credentials.mail_user_name,
  password: Rails.application.credentials.mail_password,
  authentication: Rails.application.credentials.mail_authentication,
  enable_starttls_auto: Rails.application.credentials.mail_enable_starttls_auto
}