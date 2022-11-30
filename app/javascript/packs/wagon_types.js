$(document).ready(function() {
  let coupe = $('#wagon_type_coupewagon');
  let sleeping = $('#wagon_type_sleepingwagon');
  let seated = $('#wagon_type_seatedwagon');
  let economy = $('#wagon_type_economywagon');

  let coupe_seats = $('#economy-and-coupe-class-seats');
  let economy_seats = $('#economy-class-seats')
  let seated_seats = $('#seated-class-seats')
  let not_sleeping_seats = $('#not-sleeping-class-seats')

  coupe.click(function() {
    coupe_seats.show();
    not_sleeping_seats.show();
    economy_seats.hide();
    seated_seats.hide();
  });

  sleeping.click(function() {
    coupe_seats.show();
    not_sleeping_seats.hide();
    economy_seats.hide();
    seated_seats.hide();
  });

  seated.click(function() {
    seated_seats.show();
    coupe_seats.hide();
  });

  economy.click(function() {
    coupe_seats.show();
    not_sleeping_seats.show();
    economy_seats.show();
    seated_seats.hide();
  });
});
