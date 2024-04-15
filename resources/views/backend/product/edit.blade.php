@extends('backend.layouts.master')

@section('main-content')

<div class="card">
    <h5 class="card-header">Edit Book</h5>
    <div class="card-body">
      <form method="post" action="{{route('product.update',$product->id)}}">
        @csrf 
        @method('PATCH')
        <div class="form-group">
          <label for="inputTitle" class="col-form-label">Title <span class="text-danger">*</span></label>
          <input id="inputTitle" type="text" name="title" placeholder="Enter title"  value="{{$product->title}}" class="form-control">
          @error('title')
          <span class="text-danger">{{$message}}</span>
          @enderror
        </div>

        <div class="form-group">
          <label for="summary" class="col-form-label">Summary <span class="text-danger">*</span></label>
          <textarea class="form-control" id="summary" name="summary">{{$product->summary}}</textarea>
          @error('summary')
          <span class="text-danger">{{$message}}</span>
          @enderror
        </div>

        <div class="form-group">
          <label for="description" class="col-form-label">Description</label>
          <textarea class="form-control" id="description" name="description">{{$product->description}}</textarea>
          @error('description')
          <span class="text-danger">{{$message}}</span>
          @enderror
        </div>


        <div class="form-group">
          <label for="is_featured">Is Featured</label><br>
          <input type="checkbox" name='is_featured' id='is_featured' value='{{$product->is_featured}}' {{(($product->is_featured) ? 'checked' : '')}}> Yes                        
        </div>
              {{-- {{$categories}} --}}

        <div class="form-group">
          <label for="cat_id">Genre<span class="text-danger">*</span></label>
          <select name="cat_id" id="cat_id" class="form-control">
              <option value="">--Select any genre--</option>
              @foreach($categories as $key=>$cat_data)
                  <option value='{{$cat_data->id}}' {{(($product->cat_id==$cat_data->id)? 'selected' : '')}}>{{$cat_data->title}}</option>
              @endforeach
          </select>
        </div>
        @php 
          $sub_cat_info=DB::table('categories')->select('title')->where('id',$product->child_cat_id)->get();
        // dd($sub_cat_info);

        @endphp
        {{-- {{$product->child_cat_id}} --}}
        <div class="form-group {{(($product->child_cat_id)? '' : 'd-none')}}" id="child_cat_div">
          <label for="child_cat_id">Sub Genre</label>
          <select name="child_cat_id" id="child_cat_id" class="form-control">
              <option value="">--Select any sub genre--</option>
              
          </select>
        </div>

        <div class="form-group">
          <label for="price" class="col-form-label">Price(NRS) <span class="text-danger">*</span></label>
          <input id="price" type="number" name="price" placeholder="Enter price"  value="{{$product->price}}" class="form-control">
          @error('price')
          <span class="text-danger">{{$message}}</span>
          @enderror
        </div>

        <div class="form-group">
          <label for="discount" class="col-form-label">Discount(%)</label>
          <input id="discount" type="number" name="discount" min="0" max="100" placeholder="Enter discount"  value="{{$product->discount}}" class="form-control">
          @error('discount')
          <span class="text-danger">{{$message}}</span>
          @enderror
        </div>
        <div class="form-group">
          <label for="author">Author</label>
          <select name="author[]" class="form-control selectpicker"  multiple data-live-search="true">
              <option value="">--Select any author--</option>
              @foreach($items as $item)              
                @php 
                $data=explode(',',$item->author);
                // dd($data);
                @endphp
             <option value="Bhanubhakta Acharya" @if(in_array("Bhanubhakta Acharya", $data)) selected @endif>Bhanubhakta Acharya (भानुभक्त आचार्य)</option>
             <option value="Laxmi Prasad Devkota" @if(in_array("Laxmi Prasad Devkota", $data)) selected @endif>Laxmi Prasad Devkota (लक्ष्मीप्रसाद देवकोटा)</option>
             <option value="BP Koirala" @if(in_array("BP Koirala", $data)) selected @endif>BP Koirala (बीपी कोइराला)</option>
             <option value="Parijat" @if(in_array("Parijat", $data)) selected @endif>Parijat (पारिजात)</option>
             <option value="Khagendra Sangraula" @if(in_array("Khagendra Sangraula", $data)) selected @endif>Khagendra Sangraula (खगेन्द्र संग्रौला)</option>
             <option value="Sharada Sharma" @if(in_array("Sharada Sharma", $data)) selected @endif>Sharada Sharma (शारदा शर्मा)</option>
             <option value="Dhruba Chandra Gautam" @if(in_array("Dhruba Chandra Gautam", $data)) selected @endif>Dhruba Chandra Gautam (ध्रुव चन्द्र गौतम)</option>
             <option value="Buddhi Sagar" @if(in_array("Buddhi Sagar", $data)) selected @endif>Buddhi Sagar (बुद्धि सागर)</option>
             <option value="Amar Neupane" @if(in_array("Amar Neupane", $data)) selected @endif>Amar Neupane (अमर न्यौपाने)</option>
             <option value="Subin Bhattarai" @if(in_array("Subin Bhattarai", $data)) selected @endif>Subin Bhattarai (सुविन भट्टराई)</option>
             <option value="Yubraj Nayaghare" @if(in_array("Yubraj Nayaghare", $data)) selected @endif>Yubraj Nayaghare (युवराज नयाँघरे)</option>
             <option value="Bal Krishna Sama" @if(in_array("Bal Krishna Sama", $data)) selected @endif>Bal Krishna Sama (बलकृष्ण सामा)</option>
             <option value="Sarubhakta" @if(in_array("Sarubhakta", $data)) selected @endif>Sarubhakta (सारुभक्त)</option>
             <option value="Jhamak Ghimire" @if(in_array("Jhamak Ghimire", $data)) selected @endif>Jhamak Ghimire (झमाक घिमिरे)</option>
             <option value="Gopal Prasad Rimal" @if(in_array("Gopal Prasad Rimal", $data)) selected @endif>Gopal Prasad Rimal (गोपाल प्रसाद रिमाल)</option>
             
             <option value="Jhumpa Lahiri" @if(in_array("Jhumpa Lahiri", $data)) selected @endif>Jhumpa Lahiri</option>
             <option value="Arundhati Roy" @if(in_array("Arundhati Roy", $data)) selected @endif>Arundhati Roy</option>
             <option value="Chitra Banerjee Divakaruni" @if(in_array("Chitra Banerjee Divakaruni", $data)) selected @endif>Chitra Banerjee Divakaruni</option>
             <option value="Salman Rushdie" @if(in_array("Salman Rushdie", $data)) selected @endif>Salman Rushdie</option>
             <option value="Ruskin Bond" @if(in_array("Ruskin Bond", $data)) selected @endif>Ruskin Bond</option>
            
             <option value="Stephen King" @if(in_array("Stephen King", $data)) selected @endif>Stephen King</option>
             <option value="J.K. Rowling" @if(in_array("J.K. Rowling", $data)) selected @endif>J.K. Rowling</option>
             <option value="Harper Lee" @if(in_array("Harper Lee", $data)) selected @endif>Harper Lee</option>
             <option value="Toni Morrison" @if(in_array("Toni Morrison", $data)) selected @endif>Toni Morrison</option>
             <option value="John Green" @if(in_array("John Green", $data)) selected @endif>John Green</option>
             <option value="J.R.R. Tolkien" @if(in_array("J.R.R. Tolkien", $data)) selected @endif>J.R.R. Tolkien</option>
             <option value="George Orwell" @if(in_array("George Orwell", $data)) selected @endif>George Orwell</option>
             <option value="Mark Twain" @if(in_array("Mark Twain", $data)) selected @endif>Mark Twain</option>
             <option value="J.D. Salinger" @if(in_array("J.D. Salinger", $data)) selected @endif>J.D. Salinger</option>
             <option value="Margaret Atwood" @if(in_array("Margaret Atwood", $data)) selected @endif>Margaret Atwood</option>
             <option value="Collen Hover" @if(in_array("Collen Hover", $data)) selected @endif>Collen Hover</option>
             <option value="Raju Adhikari" @if(in_array("Raju Adhikari", $data)) selected @endif>Raju Adhikari</option>
             <option value="Binod Chaudhary" @if(in_array("Raju Adhikari", $data)) selected @endif>Raju Adhikari</option>
              
              @endforeach
          </select>
        </div>
        <div class="form-group">
          <label for="brand_id">Publication</label>
          <select name="brand_id" class="form-control">
              <option value="">--Select Publication--</option>
             @foreach($brands as $brand)
              <option value="{{$brand->id}}" {{(($product->brand_id==$brand->id)? 'selected':'')}}>{{$brand->title}}</option>
             @endforeach
          </select>
        </div>

        <div class="form-group">
          <label for="condition">Condition</label>
          <select name="condition" class="form-control">
              <option value="">--Select Condition--</option>
              <option value="default" {{(($product->condition=='default')? 'selected':'')}}>Trending</option>
              <option value="new" {{(($product->condition=='new')? 'selected':'')}}>Best Selling</option>
              <option value="hot" {{(($product->condition=='hot')? 'selected':'')}}>Latest Arrivals</option>
          </select>
        </div>

        <div class="form-group">
          <label for="stock">Quantity <span class="text-danger">*</span></label>
          <input id="quantity" type="number" name="stock" min="0" placeholder="Enter quantity"  value="{{$product->stock}}" class="form-control">
          @error('stock')
          <span class="text-danger">{{$message}}</span>
          @enderror
        </div>
        <div class="form-group">
          <label for="inputPhoto" class="col-form-label">Photo <span class="text-danger">*</span></label>
          <div class="input-group">
              <span class="input-group-btn">
                  <a id="lfm" data-input="thumbnail" data-preview="holder" class="btn btn-primary text-white">
                  <i class="fas fa-image"></i> Choose
                  </a>
              </span>
          <input id="thumbnail" class="form-control" type="text" name="photo" value="{{$product->photo}}">
        </div>
        <div id="holder" style="margin-top:15px;max-height:100px;"></div>
          @error('photo')
          <span class="text-danger">{{$message}}</span>
          @enderror
        </div>
        
        <div class="form-group">
          <label for="status" class="col-form-label">Status <span class="text-danger">*</span></label>
          <select name="status" class="form-control">
            <option value="active" {{(($product->status=='active')? 'selected' : '')}}>Active</option>
            <option value="inactive" {{(($product->status=='inactive')? 'selected' : '')}}>Inactive</option>
        </select>
          @error('status')
          <span class="text-danger">{{$message}}</span>
          @enderror
        </div>
        <div class="form-group mb-3">
           <button class="btn btn-success" type="submit">Update</button>
        </div>
      </form>
    </div>
</div>

@endsection

@push('styles')
<link rel="stylesheet" href="{{asset('backend/summernote/summernote.min.css')}}">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.13.1/css/bootstrap-select.css" />

@endpush
@push('scripts')
<script src="/vendor/laravel-filemanager/js/stand-alone-button.js"></script>
<script src="{{asset('backend/summernote/summernote.min.js')}}"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.13.1/js/bootstrap-select.min.js"></script>

<script>
    $('#lfm').filemanager('image');

    $(document).ready(function() {
    $('#summary').summernote({
      placeholder: "Write short description.....",
        tabsize: 2,
        height: 150
    });
    });
    $(document).ready(function() {
      $('#description').summernote({
        placeholder: "Write detail Description.....",
          tabsize: 2,
          height: 150
      });
    });
</script>

<script>
  var  child_cat_id='{{$product->child_cat_id}}';
        // alert(child_cat_id);
        $('#cat_id').change(function(){
            var cat_id=$(this).val();

            if(cat_id !=null){
                // ajax call
                $.ajax({
                    url:"/admin/category/"+cat_id+"/child",
                    type:"POST",
                    data:{
                        _token:"{{csrf_token()}}"
                    },
                    success:function(response){
                        if(typeof(response)!='object'){
                            response=$.parseJSON(response);
                        }
                        var html_option="<option value=''>--Select any one--</option>";
                        if(response.status){
                            var data=response.data;
                            if(response.data){
                                $('#child_cat_div').removeClass('d-none');
                                $.each(data,function(id,title){
                                    html_option += "<option value='"+id+"' "+(child_cat_id==id ? 'selected ' : '')+">"+title+"</option>";
                                });
                            }
                            else{
                                console.log('no response data');
                            }
                        }
                        else{
                            $('#child_cat_div').addClass('d-none');
                        }
                        $('#child_cat_id').html(html_option);

                    }
                });
            }
            else{

            }

        });
        if(child_cat_id!=null){
            $('#cat_id').change();
        }
</script>
@endpush