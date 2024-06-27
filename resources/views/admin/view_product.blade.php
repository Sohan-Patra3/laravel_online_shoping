<!DOCTYPE html>
<html>

<head>
    @include('admin.css')
    <style>
        .div_deg {
            display: flex;
            justify-content: center;
            align-items: center;
            margin-top: 60px;
        }

        .div_deg {
            display: flex;
            justify-content: center;
            align-items: center;
            margin: 30px;
        }

        .table_deg {
            text-align: center;
            margin: auto;
            border: 2px solid yellowgreen;
            margin-top: 50px;
            width: 600px;
        }

        th {
            background-color: skyblue;
            padding: 15px;
            font-size: 20px;
            font-weight: bold;
            color: white
        }

        .table_td {
            color: white;
            padding: 10px;
            border: 1px solid skyblue;
        }

        input[type="search"] {
            width: 400px;
            height: 35px;
            margin-left: 50px;
        }
    </style>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>

<body>
    @include('admin.header')

    @include('admin.sidebar')

    <!-- Sidebar Navigation end-->
    <div class="page-content">
        <div class="page-header">
            <div class="container-fluid">
                <div class="div_deg">
                    <form action="{{ url('product_search') }}" method="GET">
                        @csrf
                        <input type="search" name="search"></input>
                        <input type="submit" class="btn btn-secondary"></input>
                    </form>
                </div>
                <div class="div_deg">
                    <table class="table_deg">
                        <tr>
                            <th>Product Title</th>
                            <th>Description</th>
                            <th>Category</th>
                            <th>Price</th>
                            <th>Quantity</th>
                            <th>Image</th>
                            <th>Edit</th>
                            <th>Delete</th>
                        </tr>
                        @foreach ($product as $products)
                            <tr>
                                <td class="table_td">{{ $products->title }}</td>
                                <td class="table_td">{!! Str::limit($products->description, 10) !!}</td>
                                <td class="table_td">{{ $products->category }}</td>
                                <td class="table_td">{{ $products->price }}</td>
                                <td class="table_td">{{ $products->quantity }}</td>
                                <td class="">
                                    <img height="100" width="100" src="{{ asset('products/' . $products->image) }}"
                                        alt="">
                                </td>
                                <td class="table_td">
                                    <a href="{{ url('update_product', $products->slug) }}"
                                        class="btn btn-success">Edit</a>
                                </td>

                                <td class="table_td">
                                    <a class="btn btn-danger" href="{{ url('delete_product', $products->id) }}"
                                        onclick="confirmation(event)">Delete</a>
                                </td>
                            </tr>
                        @endforeach
                    </table>

                </div>
                <div class="div_deg">
                    {{ $product->links() }}
                </div>
            </div>
        </div>
    </div>
    <!-- JavaScript files-->

    <script>
        function confirmation(ev) {
            ev.preventDefault();
            var urlToRedirect = ev.currentTarget.getAttribute('href');

            console.log(urlToRedirect);

            swal({
                    title: "Are You Sure to Delete This",
                    text: "This delete wil be parmanent",
                    icon: "warning",
                    buttons: true,
                    dangerMode: true,
                })
                .then((willCancel) => {
                    if (willCancel) {
                        window.location.href = urlToRedirect;
                    }
                });
        }
    </script>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"
        integrity="sha512-AA1Bzp5Q0K1KanKKmvN/4d3IRKVlv9PYgwFPvm32nPO6QS8yH1HO7LbgB1pgiOxPtfeg5zEn2ba64MUcqJx6CA=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script src="{{ asset('admincss/vendor/jquery/jquery.min.js') }}"></script>
    <script src="{{ asset('admincss/vendor/popper.js/umd/popper.min.js') }}"></script>
    <script src="{{ asset('admincss/vendor/bootstrap/js/bootstrap.min.js') }}"></script>
    <script src="{{ asset('admincss/vendor/jquery.cookie/jquery.cookie.js') }}"></script>
    <script src="{{ asset('admincss/vendor/chart.js/Chart.min.js') }}"></script>
    <script src="{{ asset('admincss/vendor/jquery-validation/jquery.validate.min.js') }}"></script>
    <script src="{{ asset('admincss/js/charts-home.js') }}"></script>
    <script src="{{ asset('admincss/js/front.js') }}"></script>
</body>

</html>
