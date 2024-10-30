@extends('backend.layout.app')
@section('main')
    <!-- Page Wrapper -->
    <div id="wrapper">

        @include('backend.layout.sidebar')

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

                @include('backend.layout.topbar')

                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <h1 class="h3 mb-4 text-gray-800">Create Products</h1>

                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header d-flex justify-content-between align-items-center py-3">
                            <h6 class="m-0 font-weight-bold text-primary">Create Products</h6>
                            <a href="{{ route('products_dashboard') }}" class="btn btn-outline-primary">Back</a>
                        </div>
                        <div class="card-body">
                            <form action="{{ route('products_dashboard.store') }}" method="post" enctype="multipart/form-data">
                                @csrf
                                <div class="mb-3">
                                    <label for="foto" class="form-label">Foto</label>
                                    <input
                                        type="file"
                                        class="form-control"
                                        name="foto"
                                        id="foto"
                                        placeholder=""
                                        aria-describedby="fileHelpId"
                                    />
                                </div>

                                <div class="mb-3">
                                    <label for="nama" class="form-label">Nama</label>
                                    <input type="text" class="form-control" name="nama" id="nama"
                                        aria-describedby="helpId" placeholder="Masukkan Nama Produk" />
                                </div>

                                <div class="mb-3">
                                    <label for="deskripsi" class="form-label">Deskripsi</label>
                                    <textarea class="form-control" name="deskripsi" id="deskripsi" rows="3"></textarea>
                                </div>

                                <div class="mb-3">
                                    <label for="harga" class="form-label">Harga</label>
                                    <input type="number" class="form-control" name="harga" id="harga"
                                        aria-describedby="helpId" placeholder="Masukkan Harga Produk" />
                                </div>

                                <div class="mb-3">
                                    <label for="qty" class="form-label">QTY</label>
                                    <input type="number" class="form-control" name="qty" id="qty"
                                        aria-describedby="helpId" placeholder="Masukkan Jumlah Produk" />
                                </div>

                                <div class="mb-3">
                                    <div class="form-check form-switch">
                                        <input class="form-check-input" type="checkbox" role="switch"
                                            id="flexSwitchCheckDefault" name="show" value="1">
                                        <label class="form-check-label" for="flexSwitchCheckDefault">Show Produk</label>
                                    </div>
                                </div>


                                <div class="mb-3">
                                    <button type="submit" class="btn btn-primary form-control">Kirim</button>
                                </div>
                            </form>
                        </div>
                    </div>

                </div>
                <!-- /.container-fluid -->

            </div>
            <!-- End of Main Content -->

            @include('backend.layout.footer')

        </div>
        <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

    @include('backend.layout.logout')
@endsection
