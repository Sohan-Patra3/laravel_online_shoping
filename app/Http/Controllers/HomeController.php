<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Product;
use App\Models\User;
use App\Models\cart;
use App\Models\Order;
use Illuminate\Support\Facades\Auth;

class HomeController extends Controller
{
    public function index(){
        return view('admin.index');
    }

    public function home(){
        $product = Product::all();

        if(Auth::id()){
         $user = Auth::user();
        $user_id = $user->id;
        $count = cart::where('user_id',$user_id)->count();
        }else{
            $count = '';
        }
        return view('home.index',compact('product','count'));
    }

    public function login_home(){
        $product = Product::all();
        $user = Auth::user();
        $user_id = $user->id;
        $count = cart::where('user_id',$user_id)->count();
        return view('home.index',compact('product','count'));
    }

    public function product_details($id){
        $data = Product::find($id);
        if(Auth::id()){
        $user = Auth::user();
        $user_id = $user->id;
        $count = cart::where('user_id',$user_id)->count();
        }else{
               $count = '';
        }
        return view('home.product_details',compact('data','count'));
    }

    public function add_cart($id){
        $product_id = $id;
        $user = Auth::user();
        $user_id= $user->id;

        $data = new cart();
        $data->user_id= $user_id;
        $data->product_id = $product_id;

        $data->save();

        return redirect()->back();
    }

    public function mycart(){
         if(Auth::id()){
            $user = Auth::user();
            $userid = $user->id;
            $count = cart::where('user_id', $userid)->count();

            $cart = cart::where('user_id' , $userid)->get();
         }
        return view('home.mycart',compact('count','cart'));
    }

    public function remove_cart($id){
        cart::destroy($id);
        return redirect()->back();

    }

    public function confirm_order(Request $request){

        $name = $request->name;

        $rec_address = $request->rec_address;

        $phone = $request->phone;

        $userid= Auth::user()->id;

        $cart = cart::where('user_id' , $userid)->get();

        foreach($cart as $carts){
            $order = new Order;

            $order->name=$name;

            $order->rec_address=$rec_address;

            $order->phone=$phone;

            $order->user_id = $userid;

            $order->product_id = $carts-> product_id;

            $order->save();

        }

        // $cart_remove = cart::where('user_id' , $userid)->get();

        foreach($cart as $remove){
            $data = cart::find($remove->id);
            $data->delete();
        }

        return redirect()->back();

    }
}
