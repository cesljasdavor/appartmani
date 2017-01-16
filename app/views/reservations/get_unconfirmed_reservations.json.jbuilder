json.array! @unconfirmed_reservations.each do |user_id,email,dateFrom,dateTo,number_of_persons,accommodation_type|
  json.set!("user_id",user_id)
  json.set!("email",email)
  json.set!("dateFrom",dateFrom)
  json.set!("dateTo",dateTo)
  json.set!("number_of_persons",number_of_persons)
  json.set!("accommodation_type",accommodation_type)
end