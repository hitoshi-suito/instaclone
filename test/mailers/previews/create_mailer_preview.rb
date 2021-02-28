# Preview all emails at http://localhost:3000/rails/mailers/create_mailer
class CreateMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/create_mailer/send_when_create
  def send_when_create
    CreateMailer.send_when_create
  end

end
