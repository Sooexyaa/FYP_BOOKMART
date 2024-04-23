@extends('frontend.layouts.master')

@section('title','BookMart|| About Us')

@section('main-content')

	<!-- Breadcrumbs -->
	<div class="breadcrumbs">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<div class="bread-inner">
						<ul class="bread-list">
							<li><a href="index1.html">Home<i class="ti-arrow-right"></i></a></li>
							<li class="active"><a href="blog-single.html">About Us</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- End Breadcrumbs -->

 <!-- About Us -->
 <section class="about-us section">
	<div class="container">
		<div class="row">
			<div class="col-lg-6 col-12">
				<div class="about-content">
					<h3>Welcome To <span>BookMart</span></h3>
					<p>BookMart is your go-to destination for all things book-related in Gairapatan, Pokhara. Our mission is to provide book lovers with a diverse selection of titles across various genres. Whether you're a fan of fiction, non-fiction, or anything in between, we've got something for you. Our friendly staff are here to assist you in finding the perfect book to suit your tastes. So, come on in and explore our cozy bookstore!</p>
					<div class="button">
						<a href="{{ route('blog') }}" class="btn">Our Blog</a>
						<a href="{{ route('contact') }}" class="btn primary">Contact Us</a>
					</div>
				</div>
			</div>
			<div class="col-lg-6 col-12">
				<div class="about-img overlay">
					@php
						$settings = DB::table('settings')->get();
					@endphp
					<img src="@foreach($settings as $data) {{ $data->photo }} @endforeach" alt="@foreach($settings as $data) {{ $data->photo }} @endforeach">
				</div>
			</div>
		</div>
	</div>
</section>
<!-- End About Us -->

	<!-- Start Shop Services Area -->
	<section class="shop-services section">
		<div class="container">
			<div class="row">
				<div class="col-lg-3 col-md-6 col-12">
					<!-- Start Single Service -->
					<div class="single-service">
						<i class="ti-rocket"></i>
						<h4>Free Delivery</h4>
						<p>Orders over Rs.100</p>
					</div>
					<!-- End Single Service -->
				</div>
				<div class="col-lg-3 col-md-6 col-12">
					<!-- Start Single Service -->
					<div class="single-service">
						<i class="ti-reload"></i>
						<h4>Free Return</h4>
						<p>Within 30 days returns</p>
					</div>
					<!-- End Single Service -->
				</div>
				<div class="col-lg-3 col-md-6 col-12">
					<!-- Start Single Service -->
					<div class="single-service">
						<i class="ti-lock"></i>
						<h4>Secure Payment</h4>
						<p>100% secure payment</p>
					</div>
					<!-- End Single Service -->
				</div>
				<div class="col-lg-3 col-md-6 col-12">
					<!-- Start Single Service -->
					<div class="single-service">
						<i class="ti-tag"></i>
						<h4>Best Book</h4>
						<p>Guaranteed price</p>
					</div>
					<!-- End Single Service -->
				</div>
			</div>
		</div>
	</section>
	<!-- End Shop Services Area -->

	@include('frontend.layouts.newsletter')
@endsection
