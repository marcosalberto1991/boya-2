@extends('layouts.app_admin_ui')

<script type='text/javascript'>
	<?php echo "const  Foraestados_id= $estados_id;"; ?>
	<?php echo "const  Forausers_id= $users_id;"; ?>
</script>

@section('content')
<section class="col-lg-12 connectedSortable">
	<div class="box box-warning">
		<div class="box-header with-border">
			<h3 class="box-descripcion">Lista de Factura</h3>

		</div>
		<div class="box-body">
			<div class="">
				<div class="panel panel-default">
					<div class="panel-heading">
						@can('Factura Add')
						<button href="#" id="massadd-modal" class="btn btn-success  massmodal massadd">Añadir un
							Factura</button>
						@endcan
					</div>

					<div class="panel-body" style="overflow-x:auto;">
						<table class="table table-striped table-bordered table-hover compact nowrap" id="myTable">
							<thead>


								<tr>
									<th>ID</th>
									<th>numero de factura</th>
									<th>fecha</th>
									<!--
									<th>proveedor_id</th>
									-->
									<th>estados</th>
									<th>Usuario</th>
									<th>Modificar en</th>
									<th>Creado en</th>
									<th>Ultima Modificación</th>
									<th>Acción</th>

								</tr>

							</thead>
							<tbody>


								@foreach($listmysql as $lists)

								<tr id="item_{{$lists->id}}" class=" item{{$lists->id}} @if($lists->is_published)
									warning @endif">
									<td class="col1">{{ $lists->id }}</td>
									<td class="col1">{{ $lists->numero_factura }}</td>
									<td class="col1">{{ $lists->fecha }}</td>
									<!--
									<td class="col1">
										<script type="text/javascript">
											resulmunicipios_id=Foraproveedor_id.find( cas => cas.id == {{ $lists->proveedor_id }} );
							document.write(resulmunicipios_id.nombre); 
										</script>
									</td>
									-->
									<td class="col1">
										<script type="text/javascript">
											resulmunicipios_id=Foraestados_id.find( cas => cas.id == {{ $lists->estados_id }} );
							document.write(resulmunicipios_id.nombre); 
										</script>
									</td>
									<td class="col1">
										<script type="text/javascript">
											resulmunicipios_id=Forausers_id.find( cas => cas.id == {{ $lists->users_id }} );
							document.write(resulmunicipios_id.nombre); 
										</script>
									</td>
									<td class="col1">{{ $lists->updated_at }}</td>
									<td class="col1">{{ $lists->created_at }}</td>

									<td>
										<?php if(!$lists->updated_at<"0000-00-00"){ ?>
										{{ \Carbon\Carbon::createFromFormat('Y-m-d H:i:s', $lists->updated_at)->diffForHumans() }}
										<?php } ?>
									</td>
									<td>
										@can('Factura Show')
										<button class="massshow-modal btn btn-success" data-id="{{ $lists->id}}"
											data-numero_factura="{{ $lists->numero_factura}}"
											data-fecha="{{ $lists->fecha}}" //data-proveedor_id="{{ $lists->proveedor_id}}"
											data-estados_id="{{ $lists->estados_id}}"
											data-users_id="{{ $lists->users_id}}"
											data-updated_at="{{ $lists->updated_at}}"
											data-created_at="{{ $lists->created_at}}">
											<span class="glyphicon glyphicon-eye-open"></span> Ver</button>
										@endcan
										@can('Factura Editar')
										<button class="edit-modal btn btn-info" data-id="{{ $lists->id}}"
											data-numero_factura="{{ $lists->numero_factura}}"
											data-fecha="{{ $lists->fecha}}" //data-proveedor_id="{{ $lists->proveedor_id}}"
											data-estados_id="{{ $lists->estados_id}}"
											data-users_id="{{ $lists->users_id}}"
											data-updated_at="{{ $lists->updated_at}}"
											data-created_at="{{ $lists->created_at}}"><span
												class="glyphicon glyphicon-edit"></span> Editar</button>
										@endcan
										@can('Factura Eliminar')

										<button class="massdelete-modal btn btn-danger" data-id="{{ $lists->id}}"
											data-numero_factura="{{ $lists->numero_factura}}"
											data-fecha="{{ $lists->fecha}}" //data-proveedor_id="{{ $lists->proveedor_id}}"
											data-estados_id="{{ $lists->estados_id}}"
											data-users_id="{{ $lists->users_id}}"
											data-updated_at="{{ $lists->updated_at}}"
											data-created_at="{{ $lists->created_at}}"><span
												class="glyphicon glyphicon-trash"></span>Eliminar</button>

										@endcan
										<a href="{{ $lists->id }}/Entrada" class="btn btn-info">
											ver lista de productos
										</a>




									</td>
								</tr>
								@endforeach
							</tbody>
						</table>
					</div><!-- /.panel-body -->
				</div><!-- /.panel panel-default -->
			</div>
		</div>
	</div>
	</div>
</section>
@endsection

<!-- Modal form to mass a form -->
<div id="massModal" class="modal fade" role="dialog">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-descripcion"></h4>
			</div>
			<div class="modal-body">
				<h3 class="text-center" id="msdelete">¿Seguro que quieres borrar los datos?</h3>
				<form class="form-horizontal" id="formmass" role="form">
					{{ csrf_field() }}
					<div class="row">
						<div class="col-md-6">
						</div>
					</div>
					<div class="form-group">
						<label class="control-label " for="id">ID:</label>
						<input type="text" class="form-control" id="id_mass" disabled>

					</div>

					<!-- 
					<div class='form-group'>
						<label class='control-label' for='descripcion'>id:</label>
						<div class='col-sm-10'>
						-->
					<input type='hidden' name='id' class='form-control' id='id_mass' required='required' autofocus>
					<!--
							<p class='errorid text-center alert alert-danger d-none'></p>
						</div>
					</div>
						-->

					<div class='form-group' id='numero_factura'>
						<label class='control-label' for='descripcion'>Numero de factura:</label>
						<input type='text' name='numero_factura' class='form-control input-number-line'
							id='numero_factura_mass' maxlength='45' required='required' autofocus>
						<p class='errornumero_factura text-center alert alert-danger d-none'></p>
					</div>

					<div class='form-group' id='fecha'>
						<label class='control-label' for='descripcion'>Fecha:</label>
						<input type='text' name='fecha' class='form-control' id='fecha_mass' maxlength='45'
							required='required' autofocus>
						<p class='errorfecha text-center alert alert-danger d-none'></p>
					</div>



					<div class="form-group">
						<label class="control-label" for="descripcion">Estados:</label>

						<select name="estados_id" class="form-control" id="estados_id_mass" required="required"
							autofocus>
							<option value=""></option>

							@foreach($estados_id as $lists)
							<option value="{{$lists->id}}">{{$lists->nombre}}</option>
							@endforeach

						</select>
						<!--
							<input type="select" class="form-control" id="estados_id_mass" required="required" autofocus>
							-->
						<p class="errorestados_id text-center alert alert-danger d-none"> llenar los datos</p>
					</div>

					<div class="form-group">
						<label class="control-label" for="descripcion">Usuario:</label>

						<select name="users_id" class="form-control" id="users_id_mass" required="required" autofocus>
							<option value=""></option>

							@foreach($users_id as $lists)
							<option value="{{$lists->id}}">{{$lists->nombre}}</option>
							@endforeach

						</select>
						<!--
							<input type="select" class="form-control" id="users_id_mass" required="required" autofocus>
							-->
						<p class="errorusers_id text-center alert alert-danger d-none"> llenar los datos</p>
					</div>

					<div class='form-group' id='updated_at'>
						<label class='control-label' for='descripcion'>updated_at:</label>
						<input type='text' name='updated_at' class='form-control' id='updated_at_mass' readonly
							required='required' autofocus>
						<p class='errorupdated_at text-center alert alert-danger d-none'></p>
					</div>

					<div class='form-group' id='created_at'>
						<label class='control-label' for='descripcion'>created_at:</label>
						<input type='text' name='created_at' class='form-control' id='created_at_mass' readonly
							required='required' autofocus>
						<p class='errorcreated_at text-center alert alert-danger d-none'></p>
					</div>



				</form>
				<div class="modal-footer">

					<button type="button" id="acciones" class="btn btn-primary mass" data-dismiss="modal">
						<span class="glyphicon glyphicon-check"></span> massar
					</button>
					<button type="button" class="btn btn-warning" data-dismiss="modal">
						<span class="glyphicon glyphicon-remove"></span> Cerrar
					</button>
				</div>
			</div>
		</div>
	</div>
</div>


<div class="modal fade" id="DeleteModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
	aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">Eliminar registro</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
						aria-hidden="true">&times;</span></button>
			</div>
			<div class="modal-body">Se eliminar el registro de forma permanete
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
				<button type="button" class="btn btn-danger delete" data-dismiss="modal">Eliminar</button>
			</div>
		</div>
	</div>
</div>


@section("page-js-files")
<!--
	<script src="https://code.jquery.com/jquery-2.2.4.js" integrity="sha256-iT6Q9iMJYuQiMWNd9lDyBUStIq/8PuOW33aOqmvFpqI=" crossorigin="anonymous"></script>
	<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js"></script>
	-->
@stop
@section("page-js-script")


<script type='text/javascript'>
</script>

<script type='text/javascript'>
	function obtener_data(data) {
	$('#id_mass').val(data.data('id'));
	$('#numero_factura_mass').val(data.data('numero_factura'));
	$('#fecha_mass').val(data.data('fecha'));
	//$('#proveedor_id_mass').val(data.data('proveedor_id'));
	$('#estados_id_mass').val(data.data('estados_id'));
	$('#users_id_mass').val(data.data('users_id'));
	$('#updated_at_mass').val(data.data('updated_at'));
	$('#created_at_mass').val(data.data('created_at'));
	
}
//Añadir un registro
$(document).on('click', '.massadd', function() {
	$('.modal-descripcion').text('Añadir un nuevo registro');
	$('#msdelete').text(' ');
	$('#formmass')[0].reset();
	$('#massModal').modal('show');
	$('#acciones').attr('class', 'btn btn-success add');
	//$('#formmass').attr('id', 'form_add');
	$('#acciones').text('Añadir Nuevos ');
});
/*
$(document).on('click', '.masssssmodal', function() {
	$('.modal-descripcion').text('Añadir un nuevo registro');
	$('#msdelete').text(' ');

	$('#massmodal').modal('show');
	$('#acciones').attr('class', 'btn btn-success add');
	//$('#formmass').attr('id', 'form_add');
	$('#acciones').text('Añadir Nuevos ');
});
*/

// Vista de un registro
$(document).on('click', '.massshow-modal', function() {
	obtener_data($(this));					
	$('.modal-descripcion').text('Vista de los Datos');
	$('#msdelete').text(' ');
	$('#massModal').modal('show');
	$('#acciones').attr('class', 'btn btn-info hibe');
	$('#acciones').text('Visible');
	$('#acciones').attr('disabled');
});

// Editar un registro
$(document).on('click', '.edit-modal', function() {	
	obtener_data($(this));
	id = $('#id_mass').val();
	$('#acciones').attr('class', 'btn btn-warning edit');
	$('#acciones').text('Editar');
	$('.modal-descripcion').text('Editar un Dato');
	$('#massModal').modal('show');
	$('#msdelete').text(' ');
});

// Eliminar un registro
$(document).on('click', '.massdelete-modal', function() {
	$('#id_mass').val($(this).data('id'));
	id = $('#id_mass').val();           
	$('#DeleteModal').modal('show');
});



//enviar registro para eiminar
$('.modal-footer').on('click', '.delete', function() {
	$.ajax({
		type: 'DELETE',
		url: 'Factura/'+id,
		data: {
		'_token': $('input[name=_token]').val(),
		},
		success: function(data) {
			toastr.success('Dato Eliminado!', 'Operacion Exitosa', {timeOut: 5000});
			$('#item_' + data['id']).remove();
				
		}
	});
});
		

//enviar registro para añadir
$('.modal-footer').on('click', '.add', function() {
	$.ajax({
		type: 'POST',
		url: 'Factura',
		data: $('#formmass').serialize(),
		//data: {

		error: function(jqXHR, text, error){
        	toastr.error('Error de operación!', 'No se pudo Añadir los datos<br>', {timeOut: 5000});
        },
		success: function(data) { 
			if ((data.errors)) {
				verificar(data);
				//$('#massModal').modal('show');
            	toastr.error('Formato Inválido!', 'En la verificación de datos <br>', {timeOut: 5000});	
			} else {
				toastr.success('Operación Exitosa!', 'Datos Guardados', {timeOut: 5000});
				operaciones(data,'add');
			}
		},
	});
});
						
//add

//enviar registro para editar
$('.modal-footer').on('click', '.edit', function() {
	$.ajax({
		type: 'PUT',
		url: 'Factura/' + id,
		data: $('#formmass').serialize(), 
		error: function(jqXHR, text, error){
            toastr.error('Error de operación!', 'No se pudo Añadir los datos<br>'+error, {timeOut: 5000});	
        },
		success: function(data) {
			if(data.errors){
				verificar(data);
            	toastr.error('Formato Inválido!', 'Formato invalido en el formulario <br>', {timeOut: 5000});	
				//$('#massModal').modal('show');
			} else {
               	toastr.success('Modificación Exitosa Factura!', 'Datos Modificados', {timeOut: 5000});
                operaciones(data,'edit');
			
            }
        }
    });
});
</script>


<script type="text/javascript">
	function verificar(data) {

	$('.errorid').addClass('hidden');
	$('.errornumero_factura').addClass('hidden');
	$('.errorfecha').addClass('hidden');
	//$('.errorproveedor_id').addClass('hidden');
	$('.errorestados_id').addClass('hidden');
	$('.errorusers_id').addClass('hidden');
	$('.errorupdated_at').addClass('hidden');
	$('.errorcreated_at').addClass('hidden');

	if (data.errors.id) {
    	$(".errorid").removeClass("hidden");
    	$(".errorid").text(data.errors.id);
    }
    
	if (data.errors.numero_factura) {
    	$(".errornumero_factura").removeClass("hidden");
    	$(".errornumero_factura").text(data.errors.numero_factura);
    }
    
	if (data.errors.fecha) {
    	$(".errorfecha").removeClass("hidden");
    	$(".errorfecha").text(data.errors.fecha);
    }
    /*
	if (data.errors.proveedor_id) {
    	$(".errorproveedor_id").removeClass("hidden");
    	$(".errorproveedor_id").text(data.errors.proveedor_id);
    }
    */
	if (data.errors.estados_id) {
    	$(".errorestados_id").removeClass("hidden");
    	$(".errorestados_id").text(data.errors.estados_id);
    }
    
	if (data.errors.users_id) {
    	$(".errorusers_id").removeClass("hidden");
    	$(".errorusers_id").text(data.errors.users_id);
    }
    
	if (data.errors.updated_at) {
    	$(".errorupdated_at").removeClass("hidden");
    	$(".errorupdated_at").text(data.errors.updated_at);
    }
    
	if (data.errors.created_at) {
    	$(".errorcreated_at").removeClass("hidden");
    	$(".errorcreated_at").text(data.errors.created_at);
    }
    

}
</script>



<script type='text/javascript'>
	function operaciones(data,operacion) {
	//const resulproveedor_id=Foraproveedor_id.find( cas => cas.id == data.proveedor_id ); 
		const resulestados_id=Foraestados_id.find( cas => cas.id == data.estados_id ); 
		const resulusers_id=Forausers_id.find( cas => cas.id == data.users_id ); 
		
	

	var tabla=
		"<tr  id='item_"+data.id+"'  class='item"+data.id+"'>"+
		"<td class='col1'>" + data.id + "</td>"+
		"<td>"+ data.numero_factura+"</td>"+
		"<td>"+ data.fecha+"</td>"+
		//"<td>"+ resulproveedor_id["nombre"]  +"</td>"+
		"<td>"+ resulestados_id["nombre"]  +"</td>"+
		"<td>"+ resulusers_id["nombre"]  +"</td>"+
		"<td>"+ data.updated_at+"</td>"+
		"<td>"+ data.created_at+"</td>"+
		
		'<td>Ahorra</td><td>'+					
	@can('Factura Show') 
		' <button class="massshow-modal btn btn-success"  ' + 
		"data-id='"+ data.id+"'"+
		"data-numero_factura='"+ data.numero_factura+"'"+
		"data-fecha='"+ data.fecha+"'"+
		//"data-proveedor_id='"+ data.proveedor_id+"'"+
		"data-estados_id='"+ data.estados_id+"'"+
		"data-users_id='"+ data.users_id+"'"+
		"data-updated_at='"+ data.updated_at+"'"+
		"data-created_at='"+ data.created_at+"'"+
		 
		"'><span class='glyphicon glyphicon-eye-open'></span> Ver</button>  "+ 
	@endcan			
	
	@can('Factura Editar')
		" <button class='edit-modal btn btn-info' "+
		"data-id='"+ data.id+"'"+
		"data-numero_factura='"+ data.numero_factura+"'"+
		"data-fecha='"+ data.fecha+"'"+
		//"data-proveedor_id='"+ data.proveedor_id+"'"+
		"data-estados_id='"+ data.estados_id+"'"+
		"data-users_id='"+ data.users_id+"'"+
		"data-updated_at='"+ data.updated_at+"'"+
		"data-created_at='"+ data.created_at+"'"+
		 
		"'><span class='glyphicon glyphicon-edit'></span> Editar</button>  "+ 
	@endcan

	@can('Factura Eliminar') 
		"<button class='massdelete-modal btn btn-danger'  " +
		"data-id='"+ data.id+"'"+
		"data-numero_factura='"+ data.numero_factura+"'"+
		"data-fecha='"+ data.fecha+"'"+
		//"data-proveedor_id='"+ data.proveedor_id+"'"+
		"data-estados_id='"+ data.estados_id+"'"+
		"data-users_id='"+ data.users_id+"'"+
		"data-updated_at='"+ data.updated_at+"'"+
		"data-created_at='"+ data.created_at+"'"+
		 
		"'><span class='glyphicon glyphicon-trash'></span> Eliminar</button>  "+
	@endcan
	" </td></tr>";

	if('edit'==operacion){		
		$('#item_'+data.id).replaceWith(tabla);
	}
	if('add'==operacion){
		$('#myTable').append(tabla);
	}
} 
</script>
@stop
</body>

</html>