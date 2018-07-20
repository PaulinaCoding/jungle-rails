class ApplicationMailer < ActionMailer::Base
  default from: "no-reply@jungle.com"
  

  def  email_order_receipt(user,order)
    @user = user
    @order = order
    mail(to: user.email, subject: "The order # #{@order.id} has been placed!")
  end


end

