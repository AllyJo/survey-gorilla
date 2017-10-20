get '/surveys/:survey_id/questions' do
  @survey = Survey.find(params[:survey_id])
  @questions = @survey.questions
  erb :"/questions/index", layout: false
end

post '/surveys/:survey_id/questions' do
  @questions = []
  params[:questions].each do |body|
    q = Question.new(body: body, survey_id: params[:survey_id])
    if q.save
      @questions << q
    end
  end
  if request.xhr?
    if @questions
      erb :"/questions/index", layout: false
    else
      status 422
      @question.errors.full_messages
    end
  else
    ep "not ajax"
  end
  # end
    # else
    #   if @question.save
    #     redirect "/questions/new"
    #   else
    #     @question.errors.full_messages
    #   end
    # end

end

get '/surveys/:survey_id/questions/:id' do
  # showing a question
end
