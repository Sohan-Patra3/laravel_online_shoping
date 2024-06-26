<!DOCTYPE html>
<html>

<head>
    @include('admin.css')
    <style>
        table {
            border: 2px solid skyblue;
            text-align: center
        }

        th {
            background-color: skyblue;
            padding: 10px;
            font-size: 18px;
            font-weight: bold;
            text-align: center
        }

        td {
            color: white;
            padding: 10px;
            border: 1px solid skyblue;
        }

        .table_center {
            display: flex;
            justify-content: center;
            align-items: cent
        }
    </style>
</head>

<body>
    @include('admin.header')

    @include('admin.sidebar')

    <!-- Sidebar Navigation end-->
    <div class="page-content">
        <div class="page-header">
            <h1 style="color: white">Orders</h1>
            <div class="container-fluid">

                <div class="table_center">
                    <table>
                        <tr>
                            <th>Customer Name</th>
                            <th>Address</th>
                            <th>Phone</th>
                            <th>Product Title</th>
                            <th>Price</th>
                            <th>Image</th>
                            <th>Status</th>
                            <th>Change Status</th>
                            <th>Print PDF</th>
                        </tr>
                        @foreach ($data as $order)
                            <tr>
                                <td>{{ $order->name }}</td>
                                <td>{{ $order->rec_address }}</td>
                                <td>{{ $order->phone }}</td>
                                <td>{{ $order->product->title }}</td>
                                <td>{{ $order->product->price }}</td>
                                <td><img src="/products/{{ $order->product->image }}" alt="" width="50"></td>
                                <td>
                                    @if ($order->status == 'in progress')
                                        <span style="color:red">{{ $order->status }}</span>
                                    @elseif ($order->status == 'On the way')
                                        <span style="color:skyblue">{{ $order->status }}</span>
                                    @elseif ($order->status == 'Delivered')
                                        <span style="color:yellow">{{ $order->status }}</span>
                                    @else
                                        <span>{{ $order->status }}</span>
                                    @endif
                                </td>
                                <td>
                                    <a class="btn btn-primary" href="{{ url('on_the_way', $order->id) }}">On the
                                        way</a>

                                    <a class="btn btn-success" href="{{ url('delivered', $order->id) }}">Delivered</a>
                                </td>
                                <td>
                                    <a href="{{ url('print_pdf', $order->id) }}" class="btn btn-secondary">Print
                                        PDF</a>
                                </td>
                            </tr>
                        @endforeach
                    </table>
                </div>


            </div>
        </div>
    </div>
    <!-- JavaScript files-->
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
