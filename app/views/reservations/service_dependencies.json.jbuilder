json.tv do
  @tv_statistics.each do |k1,k2,v|
    json.set!(k1.to_s+"$"+k2.to_s,v)
  end
end
json.internet do
  @internet_statistics.each do |k1,k2,v|
    json.set!(k1.to_s+"$"+k2.to_s,v)
  end
end
json.parking do
  @parking_statistics.each do |k1,k2,v|
    json.set!(k1.to_s+"$"+k2.to_s,v)
  end
end