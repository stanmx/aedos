class Reservations < ActionMailer::Base
  default :from => "from@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.reservations.confirm.subject
  #
  def confirm(reservation)
    @reservation = reservation

    mail :to => @reservation.email
  end
end
