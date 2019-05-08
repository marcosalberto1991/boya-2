<?php

	namespace App;

	use Illuminate\Database\Eloquent\Model;
	use OwenIt\Auditing\Contracts\Auditable;

	class VentasModel extends Model implements Auditable
	{

		use \OwenIt\Auditing\Auditable;
		protected $table = 'ventas';
		protected $fillable = [];

		public function mesa_id_pk() {
    		return $this->belongsTo('App\MesaModel', 'mesa_id');
		}
		public function ventas_has_producto_all() {
        	return $this->hasMany('App\Ventas_has_productoModel', 'ventas_id');
    	}
	    	


	}


