// This is a manifest file that'll be compiled into application.js.
//
// Any JavaScript file within this directory can be referenced here using a relative path.
//
// You're free to add application-wide JavaScript to this file, but it's generally better
// to create separate JavaScript files as needed.
//
//= require jquery-2.2.0.min
//= require bootstrap
//= require_tree .
//= require_self

if (typeof jQuery !== 'undefined') {
    (function($) {
        $(document).ajaxStart(function() {
            $('#spinner').fadeIn();
        }).ajaxStop(function() {
            $('#spinner').fadeOut();
        });
    })(jQuery);
}

dropContainer.ondragover = dropContainer.ondragenter = function(evt) {
    evt.preventDefault();
};

dropContainer.ondrop = function(evt) {
    // pretty simple -- but not for IE :(
    fileInput.files = evt.dataTransfer.files;

    // If you want to use some of the dropped files
    const dT = new DataTransfer();
    dT.items.add(evt.dataTransfer.files[0]);
    dT.items.add(evt.dataTransfer.files[3]);
    fileInput.files = dT.files;

    evt.preventDefault();
};
var i = 0;
function add() {
    i++;
}
function add_fields() {
    document.getElementById('wrapper').innerHTML += '<input type="file" name="filename' + i + '" value="" required="" id="filename" placeholder="Entrez un nom de fichier"> <br>\r\n';
}