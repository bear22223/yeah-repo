# coding: utf-8

User.create!( name: "管理者",
              email: "sample@email.com",
              password: "password",
              password_confirmation: "password",
              admin: true)
              
              
49.times do |n|
  name  = Faker::Name.name
  email = "sample-#{n+1}@email.com"
  password = "password"
  User.create!( name: name,
               email: email,
               password: password,
               password_confirmation: password)
end
              

  
  50.times do |n|
  note_name = "タスク#{n+1}"
  note = "タスク詳細#{n+1}"
  Task.create!( note_name: note_name,user_id:1,
                note: note)
end


  