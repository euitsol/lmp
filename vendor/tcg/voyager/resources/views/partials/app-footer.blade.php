<footer class="app-footer">
    <div class="site-footer-right">
        Design & Developed by
        <a href="https://euitsols.com" target="_blank">
            European IT Solutions </a> | Copyright &copy;
            2022-{{ date('Y') }}

        @php $version = Voyager::setting("admin.version", "1.0.1" ); @endphp
        @if (!empty($version))
          | Version  - {{ $version }}
        @endif
    </div>
</footer>
