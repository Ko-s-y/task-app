// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails, { loadCSPNonce } from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

Rails.start()
Turbolinks.start()
ActiveStorage.start()

document.addEventListener("turbolinks:load", function() {
  document.querySelectorAll("td").forEach(function(td) {
    td.addEventListener("mouseover", function(e) {
      e.currentTarget.style.backgroundColor = "#eft";
    });

    td.addEventListener("mouseout", function(e) {
      e.currentTarget.style.backgroundColor = "";
    });
  });
});

document.addEventListener("turbolinks:load", function() {
  document.querySelectorAll(".delete").forEach(function(a) {
    a.addEventListener("ajax:success", function() {
      let td = a.parentNode;
      let tr = td.parentNode;
      tr.style.display = "none";
    });
  });
});
