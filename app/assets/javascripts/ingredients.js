// $(document).ready(function() {
//   addIngredient();
//   // submitNewIngredient();
// });



// var addIngredient = function () {
//   $('body').on('submit', '.ingredient_form', function(e) {
//     e.preventDefault();

//     $form = $(this);
//     debugger

//     var url = $form.attr('action');
//     var method = $form.attr('method');
//     var data = $form.serialize();

//     request = $.ajax({
//       url: url,
//       method: method,
//       data: data
//     })

//     request.done(function (response) {
//       $(":submit").hide();
//       $('#ingredient-form').append(response)
//     })

//     // request.fail(function (response) {
//     //
//     // })

//   })
// }
