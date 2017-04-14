<!DOCTYPE html>
<html>
<head>
<title>Доска сообщений</title>
<meta charset="utf-8">
	<!-- Эти Стили оствил сдесь потому что перебивались бутстрапом-->
	<style>
		* {margin: 0;
			padding: 0;}
		html,body {background-color: black;
			height: 100%;}
		#wrapper {width: 900px;
			margin: 10px auto;
			padding: 10px;
			overflow: hidden;
			box-shadow: 1px 1px 2px #4e4e4e;
			min-height: 90%;
			background-image: url(img/fon.jpg)
		}
		.child {margin-left: 15px;}
		.comment {
			display: none;
			margin-top: 15px;
		}

	</style>
	<!-- Подключаем бутстрап свои стили и скрипты-->
	<script src="/js/jquery-3.2.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
	<link rel="stylesheet" href="/css/my.css">
	<script src="/js/my.js"></script>
</head>
<body>
<div id="wrapper">
<h1>Доска сообщений:</h1><br>
	<!-- Если пользователь авторизован показываем кнопки если нет то предлагаем авторизироваться-->
	@if (Auth::check())
	<button class="btn btn-primary" onclick="scroll_to_elem('form-comment',500)" style="margin-left: 15px">Добавить коментарий</button>
		<a class="btn btn-danger" href="{{ route('logout') }}"
		onclick="event.preventDefault(); document.getElementById('logout-form').submit();">Выйти</a>
		<form id="logout-form" action="{{ route('logout') }}" method="POST" style="display: none;">
			{{ csrf_field() }}
		</form>
	@else
		<p style="color:white">Чтобы оставлять коментарии <a style="color:black;" href="/login1"> войдите</a></p><br><br>
	@endif
<!-- Вывводим коментарии-->
<div id="comments">
@foreach($tree as $comment)
<div class="comment">
	<div class="comment1" style="margin-bottom: 10px;">
@php echo(substr($comment->created_at,0,10)); @endphp От: {{$comment->author}}
<p class="message">{{$comment->message}}</p>
	</div>
	@if (Auth::check())
<a class="btn btn-primary b-answer" id="{{$comment->id}}" href="#">Ответить</a>
	@endif
	<div  class="id{{$comment->id}} answer"></div>

@if(isset($comment->childs))
	@include('rotator',['tree'=>$comment->childs])
@endif
</div>


@endforeach

</div>
	<!-- Конец коментариев показываем кнопки Lоad more а потом форму нового сообщения -->
	<a href="#" id="loadMore" class="btn btn-success" style="margin-left: 35%;">Показать еще 2</a>


		<a href="#top" id="top" class="btn btn-danger">Наверх</a>


<div class="container" id="form-comment">
	<form method="POST" style="width:50%;">
		<caption><h2>Оставить коментарий</h2></caption>
		<div class="form-group">
	{{csrf_field()}}
			<label for="author">Автор</label>
	<input class="form-control" style="width:50%"; type="text" name="author"><br>


			<label for="email">Email</label>
	<input class="form-control" style="width:50%;" type="email" name="email"><br>

	<input type="hidden" value='0' id="parent_id" name="parent_id">

			<label for="message">Сообщение</label>
			@if (Auth::check())
	<textarea class="form-control" rows="5" name="message" required=""></textarea><br>
		</div>
	<button class="btn btn-success" type="submit">Отправить</button>
		@else
			<textarea class="form-control" rows="5" name="message" disabled>Чтобы оставлять коментарии войдите (ссылка вверху страницы)</textarea><br>
	</form>
	@endif
</div>
</form>
	
</div>
</div>
</div>
<!-- Закрываем все дивы и обрабатываем нажатие кнопки Ответ, оставил в этом файле потому что использую дидективу шаблонизатора csrf_field()
которая не будет работать в отдельном файле скрипта-->
<script>
    $('.b-answer').click(function(){
        $('.answer').html('');
        event.preventDefault();


        var html ='<form method="POST" style="width:50%;">';
        html += '<caption><h2>Ответить</h2></caption>';
        html += '<div class="form-group">';
        html += '{{csrf_field()}}';
        html += '<label for="author">Автор</label>';
        html += '<input class="form-control" style="width:50%"; type="text" name="author" required=""><br>';
        html += '<label for="email">Email</label>';
        html += '<input class="form-control" style="width:50%;" type="email" name="email" required=""><br>';
        html += '<input type="hidden" value="'+$(this).attr("id")+'" id="parent_id" name="parent_id">';
        html += '<label for="message">Сообщение</label>';
        html += '<textarea class="form-control" rows="5" name="message" required=""></textarea><br></div>';
        html += '<button class="btn btn-success" type="submit">Отправить</button>';
        html += '</form>';
        html += '<button class="btn btn-danger" id="hide1" onclick="click1()"  type="submit">Скрыть</button>';

        if ($( ".id"+$(this).attr('id')).html() == '')
        {
            $( ".id"+$(this).attr('id')).html(html);
        }
        else
        {
            $( ".id"+$(this).attr('id')).html('');
        }
    });

</script>

</body>
</html>