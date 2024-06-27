<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Product;
use App\Models\User;
use App\Models\cart;
use App\Models\Order;
use Illuminate\Support\Facades\Auth;
use Session;
use Stripe;

class HomeController extends Controller
{
    public function index(){
        $user = User::where('usertype','user')->count();
        $product = Product::all()->count();
        $order = Order::all()->count();
        $delivered = Order::where('status','Delivered')->count();
        return view('admin.index',compact('user','product','order','delivered'));
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

    public function product_details($slug){
        $data = Product::where('slug' , $slug)->get()->first();
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

    public function myorders(){

        $user = Auth::user()->id;
        $count = cart::where('user_id',$user)->get()->count();
        $order = Order::where('user_id' , $user)->get();
        return view('home.order',compact('count','order'));
    }
    public function stripe($value)
    {
        return view('home.stripe',compact('value'));
    }

    public function stripePost(Request $request,$value)
    {
        Stripe\Stripe::setApiKey(env('STRIPE_SECRET'));

        Stripe\Charge::create ([
                "amount" => $value * 100,
                "currency" => "inr",
                "source" => $request->stripeToken,
                "description" => "Test payment from itsolutionstuff.com."
        ]);

        $name = Auth::user()->name;

        $phone = Auth::user()->phone;

        $rec_address = Auth::user()->address;

        $userid= Auth::user()->id;

        $cart = cart::where('user_id' , $userid)->get();

        foreach($cart as $carts){
            $order = new Order;

            $order->name=$name;

            $order->rec_address=$rec_address;

            $order->phone=$phone;

            $order->user_id = $userid;

            $order->product_id = $carts-> product_id;

            $order->payment_status = "paid";

            $order->save();

        }

        // $cart_remove = cart::where('user_id' , $userid)->get();

        foreach($cart as $remove){
            $data = cart::find($remove->id);
            $data->delete();
        }

        return redirect('/mycart');

    }

    public function shop(){
        $product = Product::all();

        if(Auth::id()){
         $user = Auth::user();
        $user_id = $user->id;
        $count = cart::where('user_id',$user_id)->count();
        }else{
            $count = '';
        }
        return view('home.shop',compact('product','count'));
    }

    public function why(){

        if(Auth::id()){
         $user = Auth::user();
        $user_id = $user->id;
        $count = cart::where('user_id',$user_id)->count();
        }else{
            $count = '';
        }
        return view('home.why',compact('count'));
    }

    public function contactus(){
        if(Auth::id()){
            $user = Auth::user();
           $user_id = $user->id;
           $count = cart::where('user_id',$user_id)->count();
           }else{
               $count = '';
           }
           return view('home.contactus',compact('count'));
    }

    public function testimonial(){
        if(Auth::id()){
            $user = Auth::user();
           $user_id = $user->id;
           $count = cart::where('user_id',$user_id)->count();
           }else{
               $count = '';
           }
           return view('home.contactus',compact('count'));
    }

}
