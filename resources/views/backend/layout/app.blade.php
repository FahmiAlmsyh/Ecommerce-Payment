<!DOCTYPE html>
<html lang="en">

@include('backend.layout.head')
@stack('head')

<body id="page-top">
    @yield('main')


    @include('backend.layout.script')
    @stack('script')

</body>

</html>
