get '/surveys/:survey_id/responses' do
  authenticate!
  @survey = Survey.find(params[:survey_id])
  @responses = @survey.responses
  erb :"/responses/show", layout: false
end

post '/surveys/:survey_id/responses' do
  authenticate!
  @survey = Survey.find(params[:survey_id])

  params.each do |question_id, choice_id|
    if question_id != "captures" && question_id != "survey_id"
      Response.create(survey_taker_id: current_user.id, choice_id: choice_id.to_i)
    end
  end
  redirect '/'
end
