<?php

namespace App\Http\Controllers;

use App\Models\Cart;
use App\Models\Order;
use App\Models\Payment;
use App\Models\Product;
use Helper;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Xentixar\EsewaSdk\Esewa;
use Illuminate\Support\Str;

class EsewaPaymentController extends Controller
{
    public function pay(Request $request)
    {
        $price = floatval(str_replace(',', '', $request->price));
        $shipping = $request->shipping;
        // $carts = Cart::query()->where('user_id', '=', Auth::id())->get();
        if ($price > 0) {
            $esewa = new Esewa();

            $esewa->config(route('esewa.check'), route('esewa.check'), $price);
            $totalAmount = $request->price;
            if (session('coupon')) {
                // If a coupon is applied, subtract its value from the total cart price
                $totalAmount = Helper::totalCartPrice() + $shipping - session('coupon')['value'];
            } else {
                // If no coupon is applied, simply calculate the total cart price and shipping
                $totalAmount = Helper::totalCartPrice() + $shipping;
            }
            Order::query()->create([
                'user_id' => Auth::id(),
                'first_name' => $request->first_name,
                'last_name' => $request->last_name,
                'email' => $request->email,
                'phone' => $request->phone,
                'country' => $request->country,
                'address1' => $request->address1,
                'address2' => $request->address2,
                'post_code' => $request->post_code,
                'shipping' => $request->shipping,
                'price' => $request->price,
                'shipping' => $shipping,
                'payment_method' => $request->payment_method,
                'total_amount' =>  $totalAmount,
                'sub_total' => Helper::totalCartPrice(),
                'quantity' => Helper::cartCount(),
                'order_number' => 'ORD-' . strtoupper(Str::random(10)),
                'payment_status' => 'paid',
            ]);
            $esewa->init();
        }
    }

    public function check(Request $request)
    {
        $esewa = new Esewa();
        $data =  $esewa->decode();
        if ($data) {
            if ($data["status"] === 'COMPLETE') {
                $carts = Cart::query()->where('user_id', '=', Auth::id())->get();
                $msg = 'Payment succesful';
                foreach ($carts as $cart) {
                    // Retrieve the product
                    $product = Product::find($cart->product_id);

                    // Create a payment record
                    Payment::create([
                        'user_id' => Auth::id(),
                        'transaction_code' => $data['transaction_code'],
                        'amount' => $data['total_amount'], // Use the total amount provided in the data
                        'quantity' => $cart->quantity,
                        'product_id' => $cart->product_id,
                    ]);

                    // Update product quantity
                    $product->update([
                        'stock' => $product->stock - $cart->quantity, // Subtract sold quantity from stock
                    ]);

                    // Update the order associated with the cart item
                    $order = $cart->order;

                    // Check if the order exists before attempting to update it
                    if ($order) {
                        // Update the order's payment status and method
                        $order->update([
                            'payment_status' => 'Paid', // Correct the status spelling to 'Paid'
                            'payment_method' => 'Esewa',
                        ]);
                    }
                    // Delete the cart item
                    $cart->delete();
                }
                return redirect()->route('home')->with('success', 'Ordered Successful');
            }
        }
        return redirect()->route('payment-failed')->with('success', 'Ordered failed');
    }
}
