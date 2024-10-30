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
                    <h1 class="h3 mb-4 text-gray-800">Products</h1>

                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header d-flex justify-content-between align-items-center py-3">
                            <h6 class="m-0 font-weight-bold text-primary">Products</h6>
                            <a href="{{ route('products_dashboard.create') }}" class="btn btn-outline-primary">Add
                                Products</a>
                        </div>
                        <!-- Display Success Message -->
                        @if (session('success'))
                            <div id="successMessage" class="alert alert-success alert-dismissible fade show" role="alert">
                                <strong>{{ session('success') }}</strong>
                                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                        @endif

                        <div class="card-body table-responsive">
                            <table class="table ">
                                <thead>
                                    <tr>
                                        <th>No</th>
                                        <th>Foto</th>
                                        <th>Nama</th>
                                        <th>Deskripsi</th>
                                        <th>Harga</th>
                                        <th>QTY</th>
                                        <th>Show</th>
                                        <th>Aksi</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @forelse ($products as $p)
                                        <tr>
                                            <td>{{ $loop->iteration }}</td>
                                            <td><img src="{{ asset('storage/' . $p->foto) }}"
                                                    style="width: 100%; height:100px; object-fit:cover" alt=""></td>
                                            <td>{{ $p->nama }}</td>
                                            <td>{{ Str::limit($p->deskripsi, 30, '...') }}</td>
                                            <td>{{ number_format($p->harga) }}</td>
                                            <td>{{ $p->qty }}</td>
                                            <td>
                                                {{ $p->show ? 'Active' : 'Not Active' }}
                                            </td>
                                            <td>
                                                <div class="btn-group" role="group">
                                                    <a href="{{ route('products_dashboard.edit', $p->id) }}"
                                                        class="btn btn-warning text-white">Edit</a>

                                                    <form action="{{ route('products_dashboard.destroy', $p->id) }}"
                                                        method="POST" style="display: inline;">
                                                        @csrf
                                                        @method('DELETE')

                                                        <button type="submit" class="btn btn-danger text-white"
                                                            onclick="return confirm('Anda yakin ingin menghapus data ini?')">
                                                            Hapus
                                                        </button>
                                                    </form>
                                                </div>
                                            </td>
                                        </tr>

                                    @empty
                                        <tr>
                                            <td colspan="8" class="text-center">
                                                <span class=" text-secondary fw-bold">
                                                    Data Kosong
                                                </span>
                                            </td>
                                        </tr>
                                    @endforelse

                                </tbody>
                            </table>
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
