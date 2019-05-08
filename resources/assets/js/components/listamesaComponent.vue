<template>
    <div class="">
        <div class='col-lg-6 card mesa'>
            <blockquote class='mesa blockquote mb-0'>
            <div class='card-header'>{{ thought.mesa_id_pk.nombre }}</div>
            <div class='card-body'>
                
                <table class='table table-striped table-bordered table-hover compact nowrap'>
                    <tr>
                        <th>Productos</th>
                        <th>precios</th>
                        <th>Cantidad</th>
                        <th>Total</th>
                    </tr>
                   <tr v-for="data in thought.ventas_has_producto_all ">

                        <td>{{data.producto_id_pk.nombre}}</td>
                        <td>{{data.producto_id_pk.precio_venta}}</td>
                        <td>{{data.cantidad}}</td>
                        <td>{{data.producto_id_pk.precio_venta*data.cantidad}}</td>
                    </tr>
                    
                    <tr>
                        <th>Total</th>
                        <th>$2300</th>
                        <td></td>
                        <td></td>
                    </tr>
                </table>
                
            </div>
            <form action="" v-on:submit.prevent="newproducto()">
            <div class='form-group row'>
                <div class='col-lg-6'>
                    <input type="hidden" name='ventas_id' v-model="thought.id">   
                    <label class='control-label' for='descripcion'>Producto:</label>
                    <input type='text' name='producto'  class='form-control'   required='required' autofocus v-model="thought.producto" />
                    <p class='errornombre text-center alert alert-danger d-none'></p>
                </div>
                <div class='col-lg-2'>
                    <label class='control-label' for='descripcion'>cantidad:</label>
                    <input type='number' name='cantidad' class='form-control' value='1' required='required' autofocus v-model="thought.cantidad" />
                    <p class='errornombre text-center alert alert-danger d-none'></p>
                </div>
                <div class='col-lg-3'>
                    <button  class="btn btn-success" >
                        Añadir
                    </button>
                </div>
            </div>
            </form>
            </blockquote>

        </div>

    </div>
</template>

<script>
    export default {
        props: ['thought'],
        data() {

            return {
                editMode: false
            };
        },
        mounted() {
            console.log('Component mounted.')
        },
        methods: {
            onClickDelete() {
                axios.delete(`ventas_has_producto/${this.thought.id}`).then(() => {
                    this.$emit('delete');
                });
            },
            onClickEdit() {
                this.editMode = true;
            },
            
            newproducto() {
                const params = {
                    producto_id: this.thought.producto,
                    cantidad: this.thought.cantidad,
                    ventas_id: this.thought.id
                };
                this.producto_id = '';
                this.cantidad = '';
                this.ventas_id = '';
                axios.post('ventas_has_producto', params)
                    .then((response) => {
                        const thought = response.data;
                        this.$emit('new', thought);
                    });
            },
            
            newproducto_no() {
                
                //alert(this.thought.id);
                const params = {
                    producto_id: this.thought.producto,
                    cantidad: this.thought.cantidad,
                    ventas_id: this.thought.id
                };
                axios.put(`ventas_has_producto/${this.thought.id}`, params).then((response) => {
                    //this.editMode = false;
                    const thought = response.data;
                    this.$emit('update', thought);
                });



                //this.editMode = true;
            },
            onClickUpdate() {
                const params = {
                    producto_id: this.thought.producto,
                    cantidad: this.thought.cantidad,
                    cantidad: this.thought.cantidad
                };
                axios.put(`ventas_has_producto/${this.thought.id}`, params).then((response) => {
                    this.editMode = false;
                    const thought = response.data;
                    this.$emit('update', thought);
                });
            }
        }
    }
</script>