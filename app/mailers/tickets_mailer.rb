class TicketsMailer < ApplicationMailer

  def send_ticket(user, ticket)
    @user = user
    @ticket = ticket
    mail(to: @user.email, subject: t('mailer.purchase.subject'))
  end

  def deleted_ticket(user, ticket)
    @user = user
    @ticket = ticket
    mail(to: @user.email, subject: t('mailer.deletion.subject'))
  end
end