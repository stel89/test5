@php $margin=20; @endphp
@foreach($tree as $comment)
    <div class="comment child" style="margin-left:@php echo($margin).'px';@endphp">
        <div class="child1" style="margin-bottom:10px;">
        @php echo(substr($comment->created_at,0,10)); @endphp От: {{$comment->author}}
        <p>{{$comment->message}}</p>
        </div>
        @if (Auth::check())
        <a class="btn btn-primary b-answer" id="{{$comment->id}}" href="#">Ответить</a>
        @endif
        <div  class="id{{$comment->id}} answer"></div>

        @if(isset($comment->childs))
            @include('rotator',['tree'=>$comment->childs])
        @endif
    </div>
    @php $margin=$margin + 20; @endphp
@endforeach

