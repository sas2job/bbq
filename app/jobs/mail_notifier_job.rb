class MailNotifierJob < ApplicationJob
  queue_as :default

  def perform(sourse, subject)
    event = subject.event
    emails = (event.subscriptions.map(&:user_email) + [event.user.email] - [subject.user&.email]).uniq

    deliver_method = EventMailer.method(sourse)
    emails.each do |mail|
      deliver_method.call(event, subject, mail).deliver_later
    end
  end
end
