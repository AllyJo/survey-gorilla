get '/surveys' do
  @surveys = Survey.all
  erb :'/surveys/index'
end

get '/surveys/new' do
  @survey = Survey.new
  erb :"/surveys/new"
end

# survey
  # question
    # choice 1
    # choice 2
    # choice 3



