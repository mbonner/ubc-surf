
function hide_show(elementID)
{
  var elem = document.getElementById(elementID)
  //if (elem.style.display == 'all') {
  if (elem.style.display != 'none') {
    elem.style.display = ''
  }
  else {
    elem.style.display = 'none'
  }
  elem.style.display = ''
  elem.style.visibility = 'visible'
  elem.style.enabled = false 
}

function disable_element(elementID)
{
  //var count = document.forms[0].elements.length;
// PROBLEM: both po and li have the same id & same name!!!
  //li_select = document.getElementById("record_owner[id]")
  li_select = document.getElementById(elementID)
  //li_select.disabled = !li_select.disabled
  if (li_select.disabled == true) {
    li_select.disabled = false
  }
  else {
    li_select.disabled = true 
  } 
}
function enable_element(elementID)
{
  li_select = document.getElementById(elementID)
  //li_select.disabled = !li_select.disabled
  if (li_select.disabled == true) {
    li_select.disabled = false
  }
  else {
    li_select.disabled = true 
  } 
}
function enable_elements(elementIDarray)
{
  for (i = 0; i < elementIDarray.length; i++) {
    enable_element(elementIDarray[i])
  }
}
function sign_up_init()
{
  //elem = document.getElementById('trip_enrollment_car_capacity')
  //elem.disabled = true 
  //elem = document.getElementById('trip_enrollment_know_suit_size')
  //elem.disabled = true 
  elem = document.getElementById('trip_enrollment_suit_size')
  elem.disabled = true 
  elem = document.getElementById('trip_enrollment_height')
  elem.disabled = true 
  elem = document.getElementById('trip_enrollment_weight')
  elem.disabled = true 
}




