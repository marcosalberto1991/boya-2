<template>
    <div class="row">
      <div class="col-lg-6 col-md-6 col-sm-12  card mesa" style="margin-right: 5px;" v-for="venta in ventas" v-bind:key="venta.id">
        
          <div class="card-header">{{ venta.mesa_id_pk.nombre }}</div>
          
            <table class="table table-responsive table-sm">
              <tr>
                <th>Productos</th>
                <th>precios</th>
                <th>Cantidad</th>
                <th>Total</th>
                <th>Acciones</th>
              </tr>
              <tr v-for="producto in venta.ventas_has_producto_all" v-bind:key="producto.id">
                <td>{{ producto.producto_id_pk.nombre }}</td>
                <td>{{ producto.producto_id_pk.precio_venta }}</td>
                <td>{{ producto.cantidad }}</td>
                <td>{{ producto.cantidad*producto.producto_id_pk.precio_venta }}</td>
                <td>
                  <button @click="Editar_producto(producto)" class="btn btn-info btn-sm ">Editar</button>
                  <button @click="Eliminar_producto(producto.id)" class="btn btn-danger btn-sm ">Eliminar</button>
                </td>
              </tr>

              <tr>
                <th>Total</th>
                <th></th>
                <td></td>
                <td>{{ venta.total_ventas }}</td>
                <td></td>
              </tr>
            </table>
          
          <div>
            <!--inicio de form-->
            <form action v-on:submit.prevent="newproducto(venta.id)">
              <!--
                <input type='text' class='form-control' required='required' value=" venta.id" autofocus v-model="venta.id" /> 
                <input type='text' class='form-control' required='required' value="ventaid" autofocus v-model="venta_id" /> 
              -->
              <div class="form-group row">
                <div class="col-lg-6">
                  <label class="control-label" for="descripcion">Productos:</label>
                  <vue-single-select
                    v-model="producto_id"
                    name="producto"
                    placeholder="producto"
                    you-want-to-select-a-post="ok"
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
                    v-model="cantidad"
                  >
                  <p class="errornombre text-center alert alert-danger d-none"></p>
                </div>
                <div class="col-lg-2">
                  <label class="control-label" for="descripcion"></label>
                  <button class="btn btn-warning mb-2">Añadir</button>
                </div>
              </div>
            </form>
          </div>
      
      </div>
    </div>
  
</template>

<script>
import VueSingleSelect from "vue-single-select";
export default {
  data() {
    venta_id: "";
    operacion: "";
    return {
      ventas: [],
      thoughts: [],
      thought: [],
      venta: [],
      producto_id: "",
      cantidad: "1",
      productos_all: []
    };
  },
  mounted() {
    this.fetchArticles();
    axios.get("productos_all").then(response => {
      this.productos_all = response.data;
    });
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
   Eliminar_producto(id) {
      if (confirm('Are You Sure?')) {
        const params={
          _token:'sweedee'
        };
     axios.delete(`ventas_has_producto/${id}`, params).then(response => {
        const venta = response.data;
        console.info(response.data);
        this.fetchArticles();
        });
       
      }
    },
    Editar_producto(producto){
        fetch('ventas_has_producto', {
          method: 'put',
          body: JSON.stringify(this.producto),
          headers: {
            'content-type': 'application/json'
          }
        })
          .then(res => res.json())
          .then(data => {
            this.clearForm();
            alert('Article Updated');
            this.fetchArticles();
          })
          .catch(err => console.log(err));
            
    },
    newproducto(venta_id) {
      //añadir un nuevo productos
      console.info(venta_id);
      console.info(this.ventas);
      console.info(this.venta[0]);
      const params = {
        producto_id: this.producto_id.id,
        cantidad: this.cantidad,
        ventas_id: venta_id
      };
      //this.producto_id = '';
      //this.cantidad = '';
      //this.ventas_id = '';
      axios.post("ventas_has_producto", params).then(response => {
        const venta = response.data;
        //alert(venta);
      });
      this.fetchArticles();
    },
    clearForm() {
      //this.edit = false;
      this.producto_id.id = null;
      this.this.cantidad = 1;
      //this.article.title = '';
    }
  }
};
</script>