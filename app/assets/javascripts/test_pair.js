//
//= require rails-ujs
//= require activestorage
//= require_tree .
//= require codemirror
//= require jquery
//= require codemirror/modes/javascript


$(document).ready(function() {
  $('.showSolutionButton').click(function(event){
    // console.log('You clicked the Hide link');
    // event.preventDefault();
    $(".hiddenSolutions").toggleClass("show");
  });
})
