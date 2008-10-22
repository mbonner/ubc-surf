function initial_disable()
{
  li_select = document.getElementById('trip_enrollment_glove_size')
  li_select.disabled = true
  li_select = document.getElementById('trip_enrollment_booty_size')
  li_select.disabled = true
  li_select = document.getElementById('trip_enrollment_shoe_size_type')
  li_select.disabled = true
  // may have to do all of the wet suit ones as well
}
window.onload=initial_disable;