$(document).ready(function() {
  $("#create-survey-form").on("submit", surveyFormHandler)
  $(".main").on("click", ".add-question-input", addQuestionButton);
});

var surveyFormHandler = function(){
  event.preventDefault();

  $form = $(this)
  var url = $form.attr("action");
  var method = $form.attr("method");
  var data = $form.serialize();

  var request = $.ajax({
    url: url,
    method: method,
    data: data
  });

  request.done(function(response){
    $(".main").append(response);
    $form.remove();
  });

};

var addQuestionButton = function() {
  event.preventDefault();
  var questionInput = $('#question-input').clone();
  $(".question-field").append(questionInput);

};
