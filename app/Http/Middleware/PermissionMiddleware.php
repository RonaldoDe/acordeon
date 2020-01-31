<?php

namespace App\Http\Middleware;

use Closure;
use App\User;
use App\Model\Permission;
use App\Model\RolePermission;
use Illuminate\Support\Facades\Auth;

class PermissionMiddleware
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle($request, Closure $next, $module, $permission)
    {

        $user = User::where('id', Auth::id())->first();
        $current_permission = Permission::where('route', $module)->first();
        if(!$current_permission){
            return response()->json(['response' => ['error' => ['Permiso no encontrado']]], 400);
        }

        if($user){
        // Here we check the permissions associated to the role and to the user.
            $role_permissions = RolePermission::where('role_id', $user->role_id)->where('permission_id', $current_permission->id)->first();
            // We validate that the user has the permissions required to this function.
            if($role_permissions){
                if($role_permissions->$permission == 1){
                    return $next($request);
                }
            }else{
                return response()->json(['response' => ['error' => ['El rol o el usuario no tiene permiso para este módulo']]], 400);
            }
        }else{
            return response()->json(['response' => ['error' => ['No tienes permiso a esta ruta']]], 404);
        }
    }
}
