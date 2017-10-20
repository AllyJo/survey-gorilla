get '/surveys/:survey_id/questions' do
  @survey = Survey.find(params[:survey_id])
  @questions = @survey.questions
  erb :"/questions/index", layout: false
end

post '/surveys/:survey_id/questions' do
  @questions = []
  @errors = []
  params[:questions].each do |body|
    q = Question.new(body: body, survey_id: params[:survey_id])
    if q.save
      @questions << q
    else
      @errors << q
    end
  end
  if request.xhr?
    if @questions.length == params[:questions].length
      erb :"/questions/index", layout: false
    else
      status 422
      @errors.map! do |question|
        question.errors.full_messages
      end
    end
  else
    ep "not ajax"
  end
end

get '/surveys/:survey_id/questions/:id' do
  # showing a question
end
