(function () {
  "use strict";

  var header = document.getElementById("site-header");
  var navToggle = document.getElementById("nav-toggle");
  var navMenu = document.getElementById("nav-menu");
  var navLinks = Array.prototype.slice.call(document.querySelectorAll(".nav-link"));
  var sections = Array.prototype.slice.call(document.querySelectorAll("main section[id]"));
  var backToTop = document.querySelector(".back-to-top");

  function setMenu(open) {
    if (!navToggle || !navMenu) return;
    navToggle.setAttribute("aria-expanded", String(open));
    navToggle.setAttribute("aria-label", open ? "Close navigation menu" : "Open navigation menu");
    navMenu.classList.toggle("is-open", open);
    document.body.classList.toggle("nav-open", open);
  }

  if (navToggle && navMenu) {
    navToggle.addEventListener("click", function () {
      setMenu(navToggle.getAttribute("aria-expanded") !== "true");
    });

    navMenu.addEventListener("click", function (event) {
      if (event.target.closest("a")) setMenu(false);
    });

    document.addEventListener("click", function (event) {
      if (navToggle.getAttribute("aria-expanded") !== "true") return;
      if (!event.target.closest("#site-header")) setMenu(false);
    });

    document.addEventListener("keydown", function (event) {
      if (event.key === "Escape" && navToggle.getAttribute("aria-expanded") === "true") {
        setMenu(false);
        navToggle.focus();
      }
    });
  }

  function closeMenuOnDesktop() {
    if (window.innerWidth > 900) setMenu(false);
  }

  window.addEventListener("resize", closeMenuOnDesktop);

  function updateHeader() {
    if (header) header.classList.toggle("is-scrolled", window.scrollY > 12);
  }

  function updateActiveLink() {
    if (!sections.length) return;

    var offset = (header ? header.offsetHeight : 0) + 48;
    var scrollPosition = window.scrollY + offset;
    var currentId = sections[0].id;

    for (var i = 0; i < sections.length; i += 1) {
      if (sections[i].offsetTop <= scrollPosition) currentId = sections[i].id;
    }

    if (window.innerHeight + window.scrollY >= document.documentElement.scrollHeight - 4) {
      currentId = sections[sections.length - 1].id;
    }

    navLinks.forEach(function (link) {
      var isActive = link.getAttribute("href") === "#" + currentId;
      link.classList.toggle("is-active", isActive);
      if (isActive) {
        link.setAttribute("aria-current", "page");
      } else {
        link.removeAttribute("aria-current");
      }
    });
  }

  var ticking = false;

  function onScroll() {
    if (ticking) return;
    ticking = true;
    window.requestAnimationFrame(function () {
      updateHeader();
      updateActiveLink();
      ticking = false;
    });
  }

  window.addEventListener("scroll", onScroll, { passive: true });
  window.addEventListener("resize", onScroll);

  updateHeader();
  updateActiveLink();

  var revealItems = document.querySelectorAll(".reveal");
  var reduceMotion = window.matchMedia("(prefers-reduced-motion: reduce)").matches;

  if (reduceMotion || !("IntersectionObserver" in window)) {
    revealItems.forEach(function (item) {
      item.classList.add("is-visible");
    });
  } else {
    var revealObserver = new IntersectionObserver(
      function (entries, observer) {
        entries.forEach(function (entry) {
          if (!entry.isIntersecting) return;
          entry.target.classList.add("is-visible");
          observer.unobserve(entry.target);
        });
      },
      { threshold: 0.12, rootMargin: "0px 0px -36px 0px" }
    );

    revealItems.forEach(function (item) {
      revealObserver.observe(item);
    });
  }

  var year = document.getElementById("year");
  if (year) year.textContent = String(new Date().getFullYear());

  if (backToTop) {
    backToTop.addEventListener("click", function (event) {
      event.preventDefault();
      window.scrollTo({ top: 0, behavior: reduceMotion ? "auto" : "smooth" });
      var brand = document.querySelector(".brand");
      if (brand) brand.focus({ preventScroll: true });
    });
  }
})();
