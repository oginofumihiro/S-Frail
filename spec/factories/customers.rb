FactoryBot.define do
  factory :customer, class: Customer do
    last_name { "tesuto" }
    first_name  { "fumi" }
    email {"fumi@f1127"}
    password {"04211127"}
  end

end