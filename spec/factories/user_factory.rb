
Factory.define :user do |f|
  f.name 'Joe'
  f.hashed_password 'pass'
  f.salt 'salt'
end
