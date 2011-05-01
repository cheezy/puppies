
Factory.define :order do |f|
  f.name 'Sam'
  f.address '123 Main Street'
  f.email 'sam@example.com'
  f.pay_type 'Credit card'
  f.has_children true
  f.has_other_pets true
  f.other_pets_description 'Antoher dog named Koda'
end


