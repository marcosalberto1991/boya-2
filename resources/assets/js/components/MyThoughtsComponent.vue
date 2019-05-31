<template>
  <div class="row">
    <div class="col-md-12">
      <div class="col-lg-6 card mesa" v-for="venta in ventas" v-bind:key="venta.id">
        <blockquote class="mesa blockquote mb-0">
          <div class="card-header">sssss{{ venta.id }}</div>
          <div class="card-body">
            <table class="table table-striped table-bordered table-hover compact nowrap">
              <tr>
                <th>Productos</th>
                <th>precios</th>
                <th>Cantidad</th>
                <th>Total</th>
              </tr>
              <tr v-for="producto in venta.ventas_has_producto_all" v-bind:key="producto.id">
                <td>{{ producto.producto_id_pk.nombre }}</td>
                <td>{{ producto.producto_id_pk.precio_venta }}</td>
                <td>{{ producto.cantidad }}</td>
                <td>{{ producto.cantidad*producto.producto_id_pk.precio_venta }}</td>
              </tr>

              <tr>
                <th>Total</th>
                <th>$2300</th>
                <td></td>
                <td></td>
              </tr>
            </table>

            <button @click="add_productos()" class="btn btn-warning mb-2">Add</button>
          </div>
          <div>
            <!--inicio de form-->
            <form action v-on:submit.prevent="newproducto()">

                <input type='text' name='ventas_id' class='form-control' required='required' autofocus v-model="thought.id" /> 
                <div class="form-group">
                <div class="col-lg-6">
                  <label class="control-label" for="descripcion">Productos:</label>
                   <vue-single-select
                        v-on:keyup="autoComplete_2"
                        name="producto"
                        placeholder="producto"
                        you-want-to-select-a-post="ok"
                        v-model="thought.producto"
                        out-of-all-these-posts="makes sense"
                        :options="productos_all"
                        a-post-has-an-id="good for search and display"
                        the-post-has-a-title="make sure to show these"
                        option-label="nombre"
                        :required="true"
                    ></vue-single-select>
                </div>

                <div class="col-lg-2">
                  <label class="control-label" for="descripcion">cantidad:</label>
                  <input
                    type="number"
                    name="cantidad"
                    class="form-control"
                    value="1"
                    required="required"
                    autofocus
                    v-model="thought.cantidad"
                  >
                  <p class="errornombre text-center alert alert-danger d-none"></p>
                </div>
                <div class="col-lg-3">
                  <button class="btn btn-warning mb-2">Añadir</button>
                </div>
              </div>
            </form>
          </div>
        </blockquote>
      </div>
    </div>
  </div>
</template>

<script>
import VueSingleSelect from "vue-single-select";
export default {
  
  data() {
    
    return {
      ventas: [],
      thoughts: [],
      thought: [],
      producto_id: "",
      productos_all:[]
    };
    
    
    
  },
  mounted() {
    //consulta de los datos
    /*
            axios.get('venta/obtener_data').then((response) => {
                this.ventas = response;
               });
            */

    this.fetchArticles();
  
    axios.get('productos_all').then((response) => { this.productos_all = response.data; });
    
    },
    components: {
        VueSingleSelect
    },
    methods: {
    fetchArticles(page_url) {
      let vm = this;
      page_url = page_url || "venta/obtener_data";
      fetch(page_url)
        .then(res => res.json())
        .then(res => {
          this.ventas = res.data;
          //vm.makePagination(res.meta, res.links);
        })
        .catch(err => console.log(err));
    },
    add_productos() {
      fetch("venta", {
        method: "post",
        body: JSON.stringify(this.article),
        headers: {
          "content-type": "application/json"
        }
      })
        .then(res => res.json())
        .then(data => {
          // this.clearForm();
          alert("Article Added");
          this.fetchArticles();
        })
        .catch(err => console.log(err));
    },
    newproducto() { //añadir un nuevo productos
        const params = {
            producto_id: this.thought.producto.id,
            cantidad: this.thought.cantidad,
            ventas_id: 1
        };
        //this.producto_id = '';
        //this.cantidad = '';
        //this.ventas_id = '';
        axios.post('ventas_has_producto', params)
            .then((response) => {
                const thought = response.data;
                //this.$emit('new', thought);
                alert(thought);
            });
        this.fetchArticles();    
        //this.thought.ventas_has_producto_all=[{this.thought.id,this.thought.producto.id,this.thought.cantidad}];
    },
    clearForm() {}
  }
};
</script>