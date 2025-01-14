<!DOCTYPE html>
<html class="no-js" lang="">

@include('frontend.layout.head')
@stack('head')

<body>
    @yield('main')
    <!-- Add your site or application content here -->


    <!-- START: LOAD SVG -->
    <!-- <svg width="23" height="26" class="hidden" id="icon-play">
      <path
        d="M21 9.536c2.667 1.54 2.667 5.39 0 6.928l-15 8.66c-2.667 1.54-6-.385-6-3.464V4.34C0 1.26 3.333-.664 6 .876l15 8.66z"
        fill="#fff"
      />
    </svg> -->
    <!-- END: LOAD SVG  -->

    @include('frontend.layout.script')
    @stack('script')
</body>

</html>
