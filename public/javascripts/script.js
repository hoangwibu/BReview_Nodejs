
// search-box open close 
let navbar = document.querySelector(".navbar");
let searchBox = document.querySelector(".search-box .bx-search");


searchBox.addEventListener("click", ()=>{
  navbar.classList.toggle("showInput");
  if(navbar.classList.contains("showInput")){
    searchBox.classList.replace("bx-search" ,"bx-x");
  }else {
    searchBox.classList.replace("bx-x" ,"bx-search");
  }
});

// sidebar open close 
let navLinks = document.querySelector(".nav-links");
let menuOpenBtn = document.querySelector(".navbar .bx-menu");
let menuCloseBtn = document.querySelector(".nav-links .bx-x");
menuOpenBtn.onclick = function() {
navLinks.style.left = "0";
}
menuCloseBtn.onclick = function() {
navLinks.style.left = "-100%";
}


// sidebar submenu open close 
let htmlcssArrow = document.querySelector(".htmlcss-arrow");
htmlcssArrow.onclick = function() {
 navLinks.classList.toggle("show1");
}
let moreArrow = document.querySelector(".more-arrow");
moreArrow.onclick = function() {
 navLinks.classList.toggle("show2");
}
let jsArrow = document.querySelector(".js-arrow");
jsArrow.onclick = function() {
 navLinks.classList.toggle("show3");
}
//hide bar
var prevScroll = window.pageYOffset;
window.onscroll = function() {
var currentScroll = window.pageYOffset;
  if (prevScroll > currentScroll) {
    document.getElementById("n").style.top = "0";
  } else {
    document.getElementById("n").style.top = "-80px";
  }
  prevScroll = currentScroll;
}
//slide
$('.slide-container').each(function() {
  let slide = $(this).find('.slide');
  let slideWidth = slide.width();
  let itemWidth = $(this).find('.item-trending').width() + 14.33;
  let max = itemWidth * slide.children().length;
  let length = 0;

  $(window).on("resize", function() {
    slideWidth = slide.width();
    max = max - slideWidth;
  });

  $(this).find('#next').click(function() {
    length < max ? length += slideWidth : length = 0;
    slide.css("margin-left", "-" + length + "px");
  });

  $(this).find('#prev').click(function() {
    length == 0 ? length = max : length -= slideWidth;
    slide.css("margin-left", "-" + length + "px");
  });
});

//rating



