require 'faker'

User.destroy_all
Survey.destroy_all
Question.destroy_all
Choice.destroy_all
Response.destroy_all


10.times do
  users = { first_name: Faker::Name.first_name ,
            last_name: Faker::Name.last_name  ,
            username: Faker::Internet.user_name,
            email: Faker::Internet.safe_email,
            password: "111222" }

  survey = { title: Faker::Hipster.word,
             creator_id: rand(1..10) }

  response = { survey_taker_id: rand(1..10),
                choice_id: rand(1..4) }

  User.create(users)
  Survey.create(survey)
  Response.create(response)
end

2.times do
  question = { body: "#{Faker::Hipster.sentence}?",
               survey_id: rand(1..10) }
  Question.create(question)
end

4.times do
  choice = { body: Faker::Hipster.sentence,
             question_id: rand(1..2) }
  Choice.create(choice)
end

