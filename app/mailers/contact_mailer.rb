class ContactMailer < ApplicationMailer
  default from: '管理人 <fumi1127ogino@gmail.com>'
  layout 'mailer'

  # def send_when_admin_reply(user, contact)
  #   @user = user
  #   @answer = contact.reply_text
  #   mail to: user.email, subject: "【S.Frail】 お問い合わせありがとうございます"
  # end

  def send_mail(inquiry)
    @inquiry = inquiry
    mail(
      from: 'system@example.com',
      to: 'fumi1127ogino@gmail.com',
      subject: '【S.Frail】 お問い合わせありがとうございます'
    )
  end
end
