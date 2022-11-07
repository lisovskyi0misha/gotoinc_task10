let coupe = document.getElementById('wagon_type_coupewagon');
let sleeping = document.getElementById('wagon_type_sleepingwagon');
let seated = document.getElementById('wagon_type_seatedwagon');
let economy = document.getElementById('wagon_type_economywagon');

let coupe_seats = document.getElementById('economy-and-coupe-class-seats');
let economy_seats = document.getElementById('economy-class-seats')
let seated_seats = document.getElementById('seated-class-seats')
let not_sleeoing_seats = document.getElementById('not-sleeping-class-seats')

coupe.onclick = function() {
  coupe_seats.style.display = 'block'
  not_sleeoing_seats.style.display = 'block'
  economy_seats.style.display = 'none'
  seated_seats.style.display = 'none'
};

sleeping.onclick = function() {
  coupe_seats.style.display = 'block'
  not_sleeoing_seats.style.display = 'none'
  economy_seats.style.display = 'none'
  seated_seats.style.display = 'none'
};

seated.onclick = function() {
  seated_seats.style.display = 'block'
  coupe_seats.style.display = 'none'
};

economy.onclick = function() {
  coupe_seats.style.display = 'block'
  not_sleeoing_seats.style.display = 'block'
  economy_seats.style.display = 'block'
  seated_seats.style.display = 'none'
};
