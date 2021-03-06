@extends('layouts.app')
<meta charset="utf-8"/>
<meta content="IE=edge" http-equiv="X-UA-Compatible"/>
<meta content="width=device-width, initial-scale=1" name="viewport"/>
<meta content="" name="description"/>
<meta content="" name="author"/>
<link href="{{ asset('images/favicon.jpg') }}" rel="shortcut icon"/>
<meta content="{{ csrf_token() }}" name="_token"/>
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" rel="stylesheet"/>
<link href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css" rel="stylesheet"/>
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet"/>
<link href="https://cdn.datatables.net/1.10.16/css/jquery.dataTables.min.css" rel="stylesheet"/>

	<style>
		.panel-heading {
			padding: 0;
		}
		.panel-heading ul {
			list-style-type: none;
			margin: 0;
			padding: 0;
			overflow: hidden;
		}
		.panel-heading li {
			float: left;
			border-right:1px solid #bbb;
			display: block;
			padding: 14px 16px;
			text-align: center;
		}
		.panel-heading li:last-child:hover {
			background-color: #ccc;
		}
		.panel-heading li:last-child {
			border-right: none;
		}
		.panel-heading li a:hover {
			text-decoration: none;
		}

		.table.table-bordered tbody td {
			vertical-align: baseline;
		}
	</style>
@section('content')




<section class="col-lg-12 connectedSortable">
	 <div class="box box-warning">
			<div class="box-header with-border">
			  <h3 class="box-descripcion">Lista de Comuna</h3>
			</div>          
			<!-- /.box-header -->
	  <div class="box-body">
	   <div class="">
		<div class="panel panel-default">
			<div class="panel-heading">
				<ul>
					<li><i class="fa fa-file-text-o"></i> Acciones</li>
					
					@can('Comunas Add')
					<a href="#" id="massadd-modal" class="massmodal"><li> Añadir una comuna</li></a>
					@endcan
				</ul>
			</div>
		
			<div class="panel-body" style="overflow-x:auto;">	
					<table class="table table-striped table-bordered table-hover compact nowrap" id="postTable">
						<thead>
					   

							<tr>
								
								<th>Nombre</th>
								<th>Municipios</th>
								<th>Creado en</th>
								<th>Modificado en</th>
								<th>Ultima Modificación</th><th>Acciones</th>
								
							</tr>
							{{ csrf_field() }}
						</thead>
						<tbody>


							@foreach($listmysql as $lists)
						  
								<tr class="item{{$lists->id}} @if($lists->is_published) warning @endif">
								

		<td class="col1">{{ $lists->nombre }}</td>
		<td class="col1">{{ $lists->municipios_id_pk->nombre }}

<!--
		<script type="text/javascript">
			resulmunicipios_id=Foramunicipios_id.find( cas => cas.id == {{ $lists->municipios_id }} );
			document.write(resulmunicipios_id.nombre); 
		</script>
-->
		</td>
		<td class="col1">{{ $lists->created_at }}</td>
		<td class="col1">{{ $lists->updated_at }}</td>
								
		<td>{{ \Carbon\Carbon::createFromFormat('Y-m-d H:i:s', $lists->updated_at)->diffForHumans() }}</td>
		<td>			
	<a class="btn btn-success" href="{{ action('BarriosController@index',['id' => $lists->id]) }}">Lista de Barrio</a>
									



	@can('Comunas Show')
		<button class="massshow-modal btn btn-success" 
		data-id="{{ $lists->id}}"
		data-nombre="{{ $lists->nombre}}"
		data-municipios_id="{{ $lists->municipios_id}}"
		data-created_at="{{ $lists->created_at}}"
		data-updated_at="{{ $lists->updated_at}}"
		
												
												>
												<span class="glyphicon glyphicon-eye-open"></span> Ver</button>
										@endcan		
										@can('Comunas Editar')
												<button class="edit-modal btn btn-info" 
												data-id="{{ $lists->id}}"
		data-nombre="{{ $lists->nombre}}"
		data-municipios_id="{{ $lists->municipios_id}}"
		data-created_at="{{ $lists->created_at}}"
		data-updated_at="{{ $lists->updated_at}}"
		
												
												><span class="glyphicon glyphicon-edit"></span> Editar</button>
										@endcan
										@can('Comunas Eliminar') 
												
												<button class="massdelete-modal btn btn-danger"
												data-id="{{ $lists->id}}"
		data-nombre="{{ $lists->nombre}}"
		data-municipios_id="{{ $lists->municipios_id}}"
		data-created_at="{{ $lists->created_at}}"
		data-updated_at="{{ $lists->updated_at}}"
		
												
												><span class="glyphicon glyphicon-trash"></span>Eliminar</button>
										
										@endcan
										


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
					<h3 class="text-center" id="msdelete">¿Seguro que quieres borrar los  datos?</h3>
					<form class="form-horizontal" id="formmass" role="form">
						
								<input type="hidden" class="form-control" id="id_mass"  disabled>
							<!-- 
						<div class="form-group">
							<label class="control-label col-sm-2" for="id">ID:</label>
							<div class="col-sm-10">
							</div>
						</div>

						<div class='form-group'>
							<label class='control-label col-sm-2' for='descripcion'>id:</label>
							<div class='col-sm-10'>
							-->
								<input type='hidden' class='form-control' id='id_mass' required='required' autofocus>
							<!--
								<p class='errorid text-center alert alert-danger hidden'></p>
							</div>
						</div>
						-->
							
						<div class='form-group' id='nombre' >
							<label class='control-label col-sm-2' for='descripcion'>nombre:</label>
							<div class='col-sm-10'>
								<input type='text' class='form-control' id='nombre_mass' maxlength='45'   required='required' autofocus>
								<p class='errornombre text-center alert alert-danger hidden'></p>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-2" for="descripcion">Departamento:</label>
							<div class="col-sm-10">

								<select name="country" class="form-control" required="required" autofocus  id="country">
									<option value=""></option>
								@foreach($Departamento as $pais)
								
	 								<option value="{{ $pais->id }}">{{ $pais->nombre }}</option> 
								@endforeach
								</select>
							</div>
						</div>
						
						<div class="form-group">
							<label class="control-label col-sm-2" for="descripcion">Municipio:</label>
							<div class="col-sm-10">
								
								<select class="form-control" id="municipios_id_mass" required="required" autofocus >
 									<option value=""></option>

 								@foreach($municipios_id as $lists)
  									<option value="{{$lists->id}}">{{$lists->nombre}}</option>
								@endforeach
								
								</select>
								<!--
								<input type="select" class="form-control" id=municipios_id_mass" required="required" autofocus>
								-->
								<p class="errormunicipios_id text-center alert alert-danger hidden"> llenar los datos</p>
							</div>
						</div>
						
						<div class='form-group' id='created_at' >
							<label class='control-label col-sm-2' for='descripcion'>Creado en:</label>
							<div class='col-sm-10'>
								<input type='text' class='form-control' id='created_at_mass'    readonly required='required' autofocus>
								<p class='errorcreated_at text-center alert alert-danger hidden'></p>
							</div>
						</div>
						
						<div class='form-group' id='updated_at' >
							<label class='control-label col-sm-2' for='descripcion'>Modificado en:</label>
							<div class='col-sm-10'>
								<input type='text' class='form-control' id='updated_at_mass'    readonly required='required' autofocus>
								<p class='errorupdated_at text-center alert alert-danger hidden'></p>
							</div>
						</div>
						                        

					
					</form>
					<div class="modal-footer">

						<button type="button" id="acciones" class="btn btn-primary mass" data-dismiss="modal">
							<span class="glyphicon glyphicon-check"></span> massar
						</button>
						<button type="button" class="btn btn-warning" data-dismiss="modal">
							<span class="glyphicon glyphicon-remove"></span> Cerra
						</button>
					</div>
				</div>
			</div>
		</div>
	</div>

@section('page-js-files')
<script crossorigin="anonymous" integrity="sha256-iT6Q9iMJYuQiMWNd9lDyBUStIq/8PuOW33aOqmvFpqI=" src="https://code.jquery.com/jquery-2.2.4.js">
</script>
<script src="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js" type="text/javascript">
</script>	
@stop	
@section('page-js-script')
	

			
<script type='text/javascript'>
			<?php echo "const  Foramunicipios_id= $municipios_id;"; ?>
			</script>

	<script type='text/javascript'>
		 $(document).on('click','.massmodal', function() {
			$('.modal-descripcion').text('Añadir un nuevo Dato');
			$('#massModal').modal('show');
		});
		  // Show a post
		$(document).on('click', '.massshow-modal', function() {
			$('.modal-descripcion').text('Vista de los Datos');
			$('#msdelete').text(' ');

			$('#id_mass').val($(this).data('id'));
$('#nombre_mass').val($(this).data('nombre'));
$('#municipios_id_mass').val($(this).data('municipios_id'));
$('#created_at_mass').val($(this).data('created_at'));
$('#updated_at_mass').val($(this).data('updated_at'));
;
									
			
			$('#massModal').modal('show');
			$('#acciones').attr('class', 'btn btn-info hibe');
			$('#acciones').text('Visible');
			$('#acciones').attr('disabled');

		});
		// delete a post
		$(document).on('click', '.massdelete-modal', function() {
			$('.modal-descripcion').text('Eliminar los datos');
			$('#msdelete').text('¿Seguro que quieres borrar los datos?');

			

			$('#id_mass').val($(this).data('id'));
$('#nombre_mass').val($(this).data('nombre'));
$('#municipios_id_mass').val($(this).data('municipios_id'));
$('#created_at_mass').val($(this).data('created_at'));
$('#updated_at_mass').val($(this).data('updated_at'));
;
			$('#massModal').modal('show');
			id = $('#id_mass').val();           
			$('#acciones').attr('class', 'btn btn-danger delete');
			$('#acciones').text('Delete');
		});
		$('.modal-footer').on('click', '.delete', function() {
			$.ajax({
				type: 'DELETE',
				url: 'Comunas/'+id,
				data: {
					'_token': $('input[name=_token]').val(),
				},
				success: function(data) {
					toastr.success('Successfully deleted Post!', 'Success Alert', {timeOut: 5000});
					$('.item' + data['id']).remove();
					$('.col1').each(function (index) {
						$(this).html(index+1);
					});
				}
			});
		});
		// add a new post
		$(document).on('click', '.massmodal', function() {
			$('.modal-descripcion').text('Añadir un nuevo registro');
			$('#msdelete').text(' ');

			$('#massmodal').modal('show');
			$('#acciones').attr('class', 'btn btn-success add');
			//$('#formmass').attr('id', 'form_add');
			$('#acciones').text('Añadir Nuevos ');
		});
		$('.modal-footer').on('click', '.add', function() {
			$.ajax({
				type: 'POST',
				url: 'Comunas/store',
				data: {

				'id': $('#id_mass').val(),'nombre': $('#nombre_mass').val(),'municipios_id': $('#municipios_id_mass').val(),'created_at': $('#created_at_mass').val(),'updated_at': $('#updated_at_mass').val(),
					'_token': $('input[name=_token]').val(),
				},
				error: function(jqXHR, text, error){
            	toastr.error('Validation error!', 'No se pudo Añadir los datos<br>'+error, {timeOut: 5000});
        		},
				success: function(data) { 
					$('.errorid').addClass('hidden');$('.errornombre').addClass('hidden');$('.errormunicipios_id').addClass('hidden');$('.errorcreated_at').addClass('hidden');$('.errorupdated_at').addClass('hidden');;
					if ((data.errors)) {
						setTimeout(function () {
							$('#massModal').modal('show');
							toastr.error('Validation error!', 'Error Alert', {timeOut: 5000});
						}, 500);
						if(data.errors.id){$('.errorid').removeClass('hidden');$('.errorid').text(data.errors.id);
				}if(data.errors.nombre){$('.errornombre').removeClass('hidden');$('.errornombre').text(data.errors.nombre);
				}if(data.errors.municipios_id){$('.errormunicipios_id').removeClass('hidden');$('.errormunicipios_id').text(data.errors.municipios_id);
				}if(data.errors.created_at){$('.errorcreated_at').removeClass('hidden');$('.errorcreated_at').text(data.errors.created_at);
				}if(data.errors.updated_at){$('.errorupdated_at').removeClass('hidden');$('.errorupdated_at').text(data.errors.updated_at);
				};
					} else {
						toastr.success('Successfully added Post!', 'Success Alert', {timeOut: 5000});
						//var a = solicitudetipo.indexOf(data.id_tipo);
						//a++;
						//var e = solicitudestado.indexOf(data.id_estado);
						//e++;
						
//add
const resulmunicipios_id=Foramunicipios_id.find( cas => cas.id == data.municipios_id ); 
							$('#postTable').append(
						//"<tr class='item"+data.id+"'>"+
			"<td class='col1'>" + data.id + "</td>"+
			"<td>"+ data.nombre+"</td>"+
			"<td>"+ resulmunicipios_id["nombre"]  +"</td>"+
			"<td>"+ data.created_at+"</td>"+
			"<td>"+ data.updated_at+"</td>"+
			
						'  <td>Ahorra</td><td> '+
				@can('Comunas Show')
						' <button class="massshow-modal btn btn-success"  ' + 
						"' data-id='"+ data.id+
						"' data-nombre='"+ data.nombre+
						"' data-municipios_id='"+ data.municipios_id+
						"' data-created_at='"+ data.created_at+
						"' data-updated_at='"+ data.updated_at+
						 
						"'><span class='glyphicon glyphicon-eye-open'></span> Ver</button>  "+ 
				@endcan
				@can('Comunas Editar')

						" <button class='edit-modal btn btn-info' "+
						"' data-id='"+ data.id+
						"' data-nombre='"+ data.nombre+
						"' data-municipios_id='"+ data.municipios_id+
						"' data-created_at='"+ data.created_at+
						"' data-updated_at='"+ data.updated_at+
						 
						"'><span class='glyphicon glyphicon-edit'></span> Editar</button> ' "+ 
				@endcan
				@can('Comunas Eliminar')		
						" ' <button class='massdelete-modal btn btn-danger' ' " +
						"' data-id='"+ data.id+
						"' data-nombre='"+ data.nombre+
						"' data-municipios_id='"+ data.municipios_id+
						"' data-created_at='"+ data.created_at+
						"' data-updated_at='"+ data.updated_at+
						 
						"'><span class='glyphicon glyphicon-trash'></span> Eliminar</button>' "+
				@endcan
						" '</td></tr> ");

							



							
					
					}
				},
			});
		});

		// Edit a post
		$(document).on('click', '.edit-modal', function() {
			$("#id_mass").val($(this).data("id"));
			$("#nombre_mass").val($(this).data("nombre"));
			$("#municipios_id_mass").val($(this).data("municipios_id"));
			$("#created_at_mass").val($(this).data("created_at"));
			$("#updated_at_mass").val($(this).data("updated_at"));
			

			id = $('#id_mass').val();
			$('#acciones').attr('class', 'btn btn-warning edit');
			$('#acciones').text('Editar');
			$('.modal-descripcion').text('Editar un Dato');
			$('#massModal').modal('show');
			$('#msdelete').text(' ');
		});

			


			$('.modal-footer').on('click', '.edit', function() {
				$.ajax({
					type: 'PUT',
					url: 'Comunas/' + id,
					data: {
			'id': $('#id_mass').val(),
			'nombre': $('#nombre_mass').val(),
			'municipios_id': $('#municipios_id_mass').val(),
			'created_at': $('#created_at_mass').val(),
			'updated_at': $('#updated_at_mass').val(),
			'_token': $('input[name=_token]').val()
				}, 
			error: function(jqXHR, text, error){
            toastr.error('Validation error!', 'No se pudo Añadir los datos<br>'+error, {timeOut: 5000});	
        	},
			success: function(data) {
			$('.errorid').addClass('hidden');
			$('.errornombre').addClass('hidden');
			$('.errormunicipios_id').addClass('hidden');
			$('.errorcreated_at').addClass('hidden');
			$('.errorupdated_at').addClass('hidden');
				 
			if ((data.errors)) {
				setTimeout(function () {
					$('#editModal').modal('show');
					toastr.error('Validacion errorea!', 'Alerta de Error ', {timeOut: 5000});
				}, 500);
			
				if (data.errors.id) {
                	$(".error.id").removeClass("hidden");
                	$(".error.id").text(data.errorsid);
                }
				if (data.errors.nombre) {
                	$(".error.nombre").removeClass("hidden");
                	$(".error.nombre").text(data.errorsnombre);
                }
				if (data.errors.municipios_id) {
                	$(".error.municipios_id").removeClass("hidden");
                	$(".error.municipios_id").text(data.errorsmunicipios_id);
                }
				if (data.errors.created_at) {
                	$(".error.created_at").removeClass("hidden");
                	$(".error.created_at").text(data.errorscreated_at);
                }
				if (data.errors.updated_at) {
                	$(".error.updated_at").removeClass("hidden");
                	$(".error.updated_at").text(data.errorsupdated_at);
                }
 				} else {
                	toastr.success('Successfully updated Comunas!', 'Success Alert', {timeOut: 5000});
                //update

			const resulmunicipios_id=Foramunicipios_id.find( cas => cas.id == data.municipios_id ); 
				

				$('.item' + data.id).replaceWith(
"<tr class='item"+data.id+"'>"+
//"<td class='col1'>" + data.id + "</td>"+
				"<td>"+ data.nombre+"</td>"+
				"<td>"+ resulmunicipios_id["nombre"]  +"</td>"+
				"<td>"+ data.created_at+"</td>"+
				"<td>"+ data.updated_at+"</td>"+
				
			'  <td>Ahorra</td><td> '+			
			
			@can('Comunas Show') 
				' <button class="massshow-modal btn btn-success"  ' + 
				"' data-id='"+ data.id+
						"' data-nombre='"+ data.nombre+
						"' data-municipios_id='"+ data.municipios_id+
						"' data-created_at='"+ data.created_at+
						"' data-updated_at='"+ data.updated_at+
						 
				"'><span class='glyphicon glyphicon-eye-open'></span> Ver</button>  "+ 
			@endcan			
			
			@can('Comunas Editar')
				" <button class='edit-modal btn btn-info' "+
				"' data-id='"+ data.id+
						"' data-nombre='"+ data.nombre+
						"' data-municipios_id='"+ data.municipios_id+
						"' data-created_at='"+ data.created_at+
						"' data-updated_at='"+ data.updated_at+
						 
				"'><span class='glyphicon glyphicon-edit'></span> Editar</button> ' "+ 
			@endcan

			@can('Comunas Eliminar') 
				"'<button class='massdelete-modal btn btn-danger' ' " +
				"' data-id='"+ data.id+
						"' data-nombre='"+ data.nombre+
						"' data-municipios_id='"+ data.municipios_id+
						"' data-created_at='"+ data.created_at+
						"' data-updated_at='"+ data.updated_at+
						 
				"'><span class='glyphicon glyphicon-trash'></span> Eliminar</button> ' "+
			@endcan
			" </td></tr> ");
					
				





  $('.edit_published').on('ifChanged', function(event){
                            id = $(this).data('id');
                            $.ajax({
                                type: 'POST',
                                url: "{{ URL::route('changeStatus') }}",
                                data: {
                                    '_token': $('input[name=_token]').val(),
                                    'id': id
                                },
                                success: function(data) {
                                    // empty
                                },
                            });
                        });
                       
                    }
                }
            });
        });

	</script>

@stop

</body>
</html>










