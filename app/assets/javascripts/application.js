//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require materialize
//= require_tree .

// Initialize select elements
document.addEventListener('DOMContentLoaded', function() {
    var elems = document.querySelectorAll('select');
    var instances = M.FormSelect.init(elems, {
        dropdownOptions: {
            // Options for dropdown of the select
        }
    });
});