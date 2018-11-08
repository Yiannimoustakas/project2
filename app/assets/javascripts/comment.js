$(document).ready(function() {
  const url = "http://localhost:3000/comments"
  $(".commentsForm").on('submit', () => {
    $.post(url, {
      body: $("#body").val(),
      solution_id: $('#solution_id').val()
    })
    .done(response => {
      console.log('response', response);

      // append new comment to existing list of comments
      $(`  <div class="commentBox">
          <h4>${response.user.name}  says:</h4>
          <p>${response.body}</p>
          <h5 class="comment">created ${this.now}</h5>
          <h5 class="comment"><a href="/solutions/${response.solution_id}" data-method: 'delete'>remove</a></h5>
        </div>`).appendTo(".commentBox")


    })
    .fail(console.warn);
    return false;
  });

})
