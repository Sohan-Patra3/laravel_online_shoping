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

        h1 {
            color: white;
        }

        label {
            display: inline-block;
            width: 200px;
            font-size: 18px !important;
            color: white;
        }

        input[type='text'],
        select {
            width: 350px;
            height: 50px;
        }

        textarea {
            width: 450px;
            height: 80px;
        }

        .input_deg {}
    </style>
</head>

<body>
    @include('admin.header')

    @include('admin.sidebar')

    <!-- Sidebar Navigation end-->
    <div class="page-content">
        <div class="page-header">
            <div class="container-fluid">
                <h1>Add Product</h1>
                <div class="div_deg">
                    <form action="{{ url('upload_product') }}" method="POST" enctype="multipart/form-data">
                        @csrf
                        <div class="input_deg">
                            <label for="">Product Title</label>
                            <input type="text" name="title">
                        </div>
                        <div class="input_deg mt-3">
                            <label for="">Description</label>
                            <textarea name="description" required></textarea>
                        </div>
                        <div class="input_deg mt-3">
                            <label for="">Price</label>
                            <input type="number" name="price" id="">
                        </div>
                        <div class="input_deg mt-3">
                            <label for="">Quantity</label>
                            <input type="number" name="quantity" id="">
                        </div>
                        <div class="input_deg mt-3">
                            <label for="">Product Category</label>
                            <select name="category" id="" required>
                                <option value="">Select a option</option>
                                @foreach ($category as $category)
                                    <option value="{{ $category->category_name }}">{{ $category->category_name }}
                                    </option>
                                @endforeach
                            </select>
                        </div>
                        <div class="input_deg mt-3">
                            <label for="">Product Image</label>
                            <input type="file" name="image">
                        </div>

                        <div class="input_deg mt-3">
                            <input type="submit" class="btn btn_success" value="Add Product">
                        </div>
                    </form>
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
