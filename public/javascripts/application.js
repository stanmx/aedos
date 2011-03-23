// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
function remove_fields(link) {  
	$(link).previous("input[type=hidden]").value = "1";  
    $(link).up(".fields").hide();  
}  

function add_fields(link, association, content) {  
	var new_id = new Date().getTime();  
	var regexp = new RegExp("new_" + association, "g");  
	$(link).up().insert({  
		before: content.replace(regexp, new_id)  
    });  
}

var Search = {
  setup: function() {
    $('#add_room').click(Search.add_room);
    $('.remove_room').live('click', Search.remove_room);
  },
  add_room: function() {
    var last_room = $('.room').last();

    if(last_room) {
      var new_room = last_room.clone();
      if(new_room.hasClass('first')) {
        new_room.append('<div style="float:left"><a class="remove_room" href="#">Remover habitacion</a></div>');
        new_room.removeClass('first');
      }
      new_room.find('input').val('0');
      new_room.insertAfter(last_room);
    }

    Search.recalculate_form();
    return false;
  },
  remove_room: function() {
    $(this).closest('.room').remove();
    Search.recalculate_form();
    return false;
  },
  recalculate_form: function() {
    $('.room').each(function(index, value) {
      $(value).find('input').each(function(index_input, value_input) {
        var id = $(value_input).attr('id').replace(/_\d_/, '_' + index + '_');
        $(value_input).attr('id', id);
         
        var name = $(value_input).attr('name').replace(/\[\d\]/, '[' + index + ']'); 
        $(value_input).attr('name', name);
      });
    });
  }
};
