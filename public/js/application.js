$(document).ready(function() {
  $("#create-survey-form").on("submit", surveyFormHandler);
  $(".main").on("click", ".add-question-input", addQuestionButton);
  $(".main").on("submit", ".question-form",questionFormHandler);
  $(".survey-title a").on("click", showSurveyHandler);
});

var questionFormHandler = function(){
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
    console.log(response)
    $(".main").append(response);
  });
};

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
  var questionInput = $('.question-input').first().clone().val("");
  $(".question-field").append(questionInput);
};

var showSurveyHandler = function() {
  event.preventDefault();

  var $link = $(this);
  var url = $link.attr("href")

  var request = $.ajax({
    url: url
  })

  request.done(function(response){
    var id = $(response).attr("id")
    $("#" + id).append(response)
  })
}

















