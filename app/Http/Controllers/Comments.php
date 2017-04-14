<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Comments1;
use Illuminate\Support\Facades\DB;
use Mail;

class Comments extends Controller
{
    //Получаем коментарии из базы и формируем массив
    public function index(){

        $comments=DB::table('comments')->orderBy('created_at','desc')->get();

        return view('comments',['tree' => $this->makeArray($comments)]);

    }

//Добавляем коментарий в базу и отправляем письмо админу и автору
    public function addComment(Request $request){
        Comments1::create([
            'parent_id' => $request->parent_id,
            'author' => $request->author,
            'email' => $request->email,
            'message' => $request->message
        ]);
        //Письмо админу

        Mail::send('mail', ['author' => $request->author,
                                    'email' => $request->email,
                                    'text' => $request->message], function ($m) use ($request) {

            $m->from('hello@app.com', 'Your Application');

            $m->to('Admin@email.com', 'Admin')->subject('Сообщение');
        });

        //Письмо автору
        Mail::send('mail', ['author' => $request->author,
            'email' => $request->email,
            'text' => $request->message], function ($m) use ($request) {

            $m->from('hello@app.com', 'Your Application');

            $m->to($request->email, $request->name)->subject('Сообщение');
        });

        return redirect()->back();

    }
// Формирование массива коментариев
    private function makeArray($comments){
        $childs=[];

        foreach($comments as $comment){
            $childs[$comment->parent_id][]=$comment;
        }

        foreach($comments as $comment){
            if(isset($childs[$comment->id]))
                $comment->childs=$childs[$comment->id];

        }
        if(count($childs)>0){
            $tree=$childs[0];
        }
        else {
            $tree=[];
        }
        return $tree;
    }
}

