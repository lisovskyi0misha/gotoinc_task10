$(document).ready(function() {
  $('a.button-for-form').click(function(e) {
    e.preventDefault();

    let object_id = $(this).data('objectId');
    let station_form = $('#edit_station_' + object_id);
    let train_form = $('#edit_train_' + object_id);
    let title = $('#object_title_' + object_id);
    let cancel_button = $('#cancel-button-object-' + object_id);

    station_form.show();
    train_form.show();
    cancel_button.show();
    title.hide();

    cancel_button.click(function() {
      station_form.hide();
      train_form.hide();
      title.show();
      cancel_button.hide();
    });
  });
});