<template>
    
<div class="col-lg-3 card ">
    <div class="card-header">nombre</div>
    <blockquote class="blockquote mb-0">
    <div class="card-body">
        <table class="table table-striped table-bordered table-hover compact nowrap">
            <tr>
                <th>Productos</th>
                <th>precios</th>
                <th>Cantidad</th>
            </tr>
            <tr>
                <td>coca cola</td>
                <td>$2300</td>
                <td>3</td>
            </tr>
        </table>
        
        
    </div>
    </blockquote>
    <div class='form-group' id='nombre' >
        <label class='control-label' for='descripcion'>nombre:</label>
        <input type='text' name='nombre' class='form-control' id='nombre_mass' maxlength='45'   required='required' autofocus>
        <p class='errornombre text-center alert alert-danger d-none'></p>
    </div>

</div>
   
</template>

<script>
    export default {
        mounted() {
            console.log('Component mounted.')
        }
    }
</script>
