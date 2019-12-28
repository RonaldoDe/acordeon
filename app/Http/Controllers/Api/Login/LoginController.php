<?php

namespace App\Http\Controllers\Api\Login;

use Illuminate\Http\Request;
use Laravel\Passport\Client;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Controller;
use App\User;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;


class LoginController extends Controller
{
    private $client;

    public function __construct()
    {
        $this->client = Client::find(2);
    }

    public function login(Request $request)
    {

      $validator=\Validator::make($request->all(),[
            'username' => 'required|email',
    		'password' => 'required|min:6',

        ]);

        if($validator->fails())
        {

          return response()->json( $errors=$validator->errors()->all(), 400);
        }
        else
        {
          //validar que el usuario exista
          $user=DB::table('users as u')->where('u.email',request('username'))->where('state_id', 1)
          ->first();
          if($user != null){
                //hashear la contraseña y validar
                if (Hash::check(request('password'), $user->password)) {
                    DB::table('oauth_access_tokens')->where('user_id', $user->id)->delete();
                    //agregar parametros al request
                    $params = [
                        'grant_type' => 'password',
                        'client_id' => $this->client->id,
                        'client_secret' => $this->client->secret,
                        'username' => request('username'),
                        'password' => request('password'),
                        'scope' => '*'
                    ];
                    //agregar parametros al request
                    $request->request->add($params);
                    $proxy = Request::create('oauth/token', 'POST');


                    return Route::dispatch($proxy);
            }else{
                return response()->json(['Usuario o contraseña incorrectas'], 400);
            }
        }else{
            return response()->json(['Usuario no encontrado'], 400);
          }


        }

    }


    public function refresh(Request $request)
    {
        $this->validate($request, [
            'refresh_token' => 'required'
        ]);

        $params = [
            'grant_type' => 'refresh_token',
            'client_id' => $this->client->id,
            'client_secret' => $this->client->secret,
            'username' => request('username'),
            'password' => request('password')
        ];

        $request->request->add($params);

         $proxy = Request::create('oauth/token', 'POST');

        return Route::dispatch($proxy);
    }


    public function logout(Request $request)
    {
      $access_token = Auth::user()->token();

        DB::table('oauth_refresh_tokens')
        ->where('access_token_id', $access_token->id)
        ->update(['revoked' => true]);

        $access_token->revoke();

      DB::table('oauth_access_tokens')->where('user_id', Auth::id())->delete();

      return response()->json(['message' => 'La sesion a sido cerrada con exito'], 200);


    }

    public function register(Request $request)
    {
        $validator=\Validator::make($request->all(),[
            'name' => 'required|min:1|max:75',
    		'last_name' => 'required|min:1|max:75',
    		'phone' => 'required|numeric',
    		'address' => 'required',
    		'dni' => 'required|max:11',
    		'email' => 'required|unique:users,email',
    		'password' => 'required|min:6',
    		#'role_id' => 'required|numeric',

        ]);

        if($validator->fails())
        {

          return response()->json( $errors=$validator->errors()->all(), 400);
        }

        $user = User::create([
            'name' => request('name'),
            'last_name' => request('last_name'),
            'phone' => request('phone'),
            'address' => request('address'),
            'dni' => request('dni'),
            'email' => request('email'),
            'password' => bcrypt(request('password')),
            'role_id' => 2,
            'category' => 'registered',
            'state_id' => 1,
        ]);

        return response()->json(['response' => 'Registro exitoso'], 200);


    }

}
