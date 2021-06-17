class InquiryMailer < ApplicationMailer
  default from: '管理人 <fumi1127ogino@gmail.com>'
  # layout "mailer"

  def received_email(inquiry)
    @inquiry = inquiry
    mail(to: inquiry.email, subject: 'お問い合わせを承りました')
  end
end
