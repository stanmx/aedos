module ReservationsHelper
  def credit_card_types
    @card_types ||= { 'MasterCard' => 0, 'Visa' => 1, 'Amex' => 2 } 
  end
end
