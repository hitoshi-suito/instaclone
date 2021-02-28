class CreateMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.create_mailer.send_when_create.subject
  #
  def send_when_create(picture)
    @picture = picture
    mail to: "htshts153@gmail.com", subject: "投稿確認メール"
  end
end
