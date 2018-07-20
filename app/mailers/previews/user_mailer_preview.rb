class UserMailerPreview < ActionMailer::Preview
  def  email_order_receipt
    UserMailer.with(user: User.first).email_order_receipt
  end
end