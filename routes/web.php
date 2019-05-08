<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
 */


//Route::apiResource('thoughts', 'ThoughtController');
Route::Resource('thoughts', 'ThoughtController');
Route::Resource('ventas_has_producto', 'Ventas_has_productoController');
Route::Resource('ventas', 'VentasController');


Route::group(['middleware' => ['web']], function () {

    Route::get('/', function () {
        return view('layout');
    });

    Route::get('lang/{lang}', function ($lang) {
        session(['lang' => $lang]);
        return \Redirect::back();
    })->where([
        'lang' => 'en|es'
    ]);
    Route::get('/', 'IndexController@index');

});

Route::resource('Lista_mesa','Lista_mesaController');
Route::resource('Proveedor','ProveedorController');
Route::resource('Producto','ProductoController');

use App\municipiosModel;
//URL::forceSchema('https');

//\URL::forceScheme('https');
Route::resource('frutas', 'FrutasController');

Route::get('perfil/{file}', function ($file) {
    return Storage::response("perfil/$file");
});
Route::get('perfil_usuario/{file}', function ($file) {
    return Storage::disk('perfil')->response("$file");
});
Route::get('ficha_detalle_foto/{file}', function ($file) {
    return Storage::disk('ficha_detalle')->response("$file");
});
Route::get('intervenir/{file}', function ($file) {
    return Storage::disk('intervenir')->response("$file");
});
/*
*/

//Route::get('/', function () {
 //   return view('inicio');
//});
//Route::get('/', 'Auth\LoginController@index');


Auth::routes();

Route::resource('ayuda','ayudaController');

Route::resource('Dispositivo','DispositivoController');


Route::resource('DatosDispositivo','DatosDispositivoController');


Route::get('Grafica', 'DatosDispositivoController@DatosGrafica');
Route::get('{id}/DatoDispositivo', 'DatosDispositivoController@DatoDispositivo');

Route::get('backup', 'BackupController@index');
Route::get('backup/create', 'BackupController@create');
Route::get('backup/download/{file_name}', 'BackupController@download');
Route::get('backup/delete/{file_name}', 'BackupController@delete');

Route::get('/home', 'HomeController@index')->name('home');

/*
Route::get('Solicitude/pdf', 'SolicitudeController@pdf');
Route::resource('Solicitude', 'SolicitudeController');
Route::post('Solicitude/changeStatus', array('as' => 'changeStatus', 'uses' => 'SolicitudeController@changeStatus'));

Route::get('Solicitude_estado/pdf', 'Solicitude_estadoController@pdf');
Route::resource('Solicitude_estado', 'Solicitude_estadoController');
Route::post('Solicitude_estado/changeStatus', array('as' => 'changeStatus', 'uses' => 'Solicitude_estadoController@changeStatus'));

*/
//Route::resource('users', 'UserController');
//Route::resource('roles', 'RoleController');
//Route::resource('permissions', 'PermissionController');
//Route::resource('posts', 'PostController');

//Route::get('/', 'PostController@index')->name('home');


  

  

Route::get('Perfil','PerfilUsuarioController@DatosUsuario' );
Route::get('Perfil/editar', 'PerfilUsuarioController@editar');


Route::post('Perfil/subir', array('as' => 'changeStatus', 'uses' => 'PerfilUsuarioController@subir'));
Route::post('Perfil/Edit_password', [ 'as' => 'Perfil.Edit_password', 'uses' => 'PerfilUsuariocontroller@Edit_password']);
Route::resource('PerfilUsuario', 'PerfilUsuarioController');

Route::resource('users', 'UserController');
Route::resource('roles', 'RoleController');
Route::resource('permissions', 'PermissionController');

Route::get('dashboard', 'dashboardController@index');

Route::resource('TipoDispositivo','TipoDispositivoController');


Route::resource('dashboard', 'dashboardController');

/*



Route::resource('posts', 'PostController');
use Illuminate\Support\Facades\Storage;
Route::get('ciudades/{id}',
    function ($id) {
        $pais_id  = $id;
        $ciudades = MunicipiosModel::where("departamento_id", "=", $pais_id)->get();
        return Response::json($ciudades);
    });


Route::get('Documentaciones', 'dashboardController@documentacion');

Route::get('pdf/reporte', ['as' => 'pdf', 'reporte' => 'pdfController@reporte']);


Route::resource('EntradaSalidaVehiculo','EntradaSalidaVehiculoController');

Route::get('SitiosParqueaderoUsuario/pdf', 'SitiosParqueaderoUsuarioController@pdf');
Route::resource('SitiosParqueaderoUsuario','SitiosParqueaderoUsuarioController');
Route::post('EntradaSalidaVehiculo/cobro', array('as' => 'EntradaSalidaVehiculo.cobro', 'uses' => 'EntradaSalidaVehiculoController@cobro'));

Route::get('SitiosParqueadero/pdf', 'SitiosParqueaderoController@pdf');
Route::resource('SitiosParqueadero','SitiosParqueaderoController');
Route::post('SitiosParqueadero/changeStatus', array('as' => 'changeStatus', 'uses' => 'SitiosParqueaderoController@changeStatus'));

Route::get('ZonaParqueadero/pdf', 'ZonaParqueaderoController@pdf');
Route::resource('ZonaParqueadero','ZonaParqueaderoController');
Route::post('ZonaParqueadero/changeStatus', array('as' => 'changeStatus', 'uses' => 'ZonaParqueaderoController@changeStatus'));

Route::get('CategoriaParqueadero/niveles/{id}', 'CategoriaParqueaderoController@niveles');
Route::resource('CategoriaParqueadero','CategoriaParqueaderoController');
Route::post('CategoriaParqueadero/changeStatus', array('as' => 'changeStatus', 'uses' => 'CategoriaParqueaderoController@changeStatus'));

Route::get('TipoVehiculo/pdf', 'TipoVehiculoController@pdf');
Route::resource('TipoVehiculo','TipoVehiculoController');
Route::post('TipoVehiculo/changeStatus', array('as' => 'changeStatus', 'uses' => 'TipoVehiculoController@changeStatus'));

Route::get('PrecioEstacionamientos/pdf', 'PrecioEstacionamientosController@pdf');
Route::resource('PrecioEstacionamientos','PrecioEstacionamientosController');
Route::post('PrecioEstacionamientos/changeStatus', array('as' => 'changeStatus', 'uses' => 'PrecioEstacionamientosController@changeStatus'));

Route::get('ParqueaderoVehiculo/pdf', 'ParqueaderoVehiculoController@pdf');
Route::resource('ParqueaderoVehiculo','ParqueaderoVehiculoController');
Route::post('ParqueaderoVehiculo/changeStatus', array('as' => 'changeStatus', 'uses' => 'ParqueaderoVehiculoController@changeStatus'));


Route::get('Registro/pdf', 'RegistroController@pdf');
Route::resource('Registro','RegistroController');
Route::post('Registro/changeStatus', array('as' => 'changeStatus', 'uses' => 'RegistroController@changeStatus'));


//Route::get('Niveles/pdf', 'NivelesController@pdf');
//Route::resource('Niveles','NivelesController');
Route::get('{id}/Niveles', 'NivelesController@lista');
Route::resource('Niveles','NivelesController');

Route::get('Perfil/Usuario', 'PerfilUsuarioController@DatosUsuario');
Route::get('Perfil/editar', 'PerfilUsuarioController@editar');
//Route::post('Perfil/subir', 'Perfil_UsuarioController@subir');
Route::post('Perfil/subir', array('as' => 'changeStatus', 'uses' => 'PerfilUsuarioController@subir'));
Route::post('Perfil/Edit_password', 'PerfilUsuarioController@Edit_password');
   

Route::post('Perfil/subir', array('as' => 'changeStatus', 'uses' => 'PerfilUsuarioController@subir'));
Route::post('Perfil/Edit_password', [ 'as' => 'Perfil.Edit_password', 'uses' => 'PerfilUsuariocontroller@Edit_password']);

 

Route::get('Perfil/pdf', 'PerfilController@pdf');
Route::resource('Perfil', 'PerfilController');
Route::post('Perfil/changeStatus', array('as' => 'changeStatus', 'uses' => 'PerfilController@changeStatus'));


Route::get('Perfil_Usuario/pdf', 'Perfil_UsuarioController@pdf');
Route::resource('Perfil_Usuario', 'Perfil_UsuarioController');
Route::post('Perfil_Usuario/changeStatus', array('as' => 'changeStatus', 'uses' => 'Perfil_UsuarioController@changeStatus'));




Route::get('Documentacion/pdf', 'DocumentacionController@pdf');
Route::resource('Documentacion', 'DocumentacionController');
Route::post('Documentacion/changeStatus', array('as' => 'changeStatus', 'uses' => 'DocumentacionController@changeStatus'));

Route::post('cargar_archivo_correo', 'CorreoController@store');
Route::post('cargar_archivo_correo', array('as' => 'Correo/store', 'uses' => 'CorreoController@store'));

Route::get('Genero/index/{idguest}', [
    'as'   => 'Genero',
    'uses' => 'GeneroController@anexadult',
]);

Route::get('Procedimiento_arbole/index/{idguest}', [
    'as'   => 'Procedimiento_arbole',
    'uses' => 'Procedimiento_arboleController@index',
]);
Route::get('Procedimiento_arbole/index', [
    'as'   => 'Procedimiento_arbole',
    'uses' => 'Procedimiento_arboleController@index',
]);


Route::get('Usuario_perfil/perfil', 'Usuario_perfilController@perfil');
Route::resource('Usuario_perfil', 'Usuario_perfilController');
Route::get('Usuario_perfil/pdf', 'Usuario_perfilController@pdf');
Route::post('Perfil/Usuario_perfil/Edit/{id}', 'PerfilUsuarioController@update');
Route::post('Usuario_perfil/changeStatus', array('as' => 'changeStatus', 'uses' => 'Usuario_perfilController@changeStatus'));

//Route::get('Reportes/pdf', 'ReportesController@pdf');
//Route::resource('Reportes','ReportesController');
//Route::post('Reportes/changeStatus', array('as' => 'changeStatus', 'uses' => 'TerritorioController@changeStatus'));

*/

Route::get('Auditoria/pdf', 'AuditoriaController@pdf');
Route::resource('Auditoria', 'AuditoriaController');
Route::post('Auditoria/changeStatus', array('as' => 'changeStatus', 'uses' => 'AuditoriaController@changeStatus'));
Route::post('Reportes/auditoria_pdf', array('as' => 'Reportes', 'uses' => 'ReportesController@auditoria_pdf'));
Route::post('Auditoria', array('as' => 'index', 'uses' => 'AuditoriaController@index'));
