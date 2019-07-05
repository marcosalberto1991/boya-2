<template>

  <div>
  <div class="row">
    <input
      type="hidden"
      class="form-control"
      value="1"
      required="required"
      autofocus
      v-model="actualiza_id"
    >

    <div class="col-md-12">
      <div  class="col-md-12">
        <button v-for="lista_mesas in lista_mesa" v-bind:key="lista_mesas.id"
          @click="lista_mesa_add(lista_mesas.id)"
          type="button"
          class="btn btn-success btn-lg"
          data-toggle="button"
          aria-pressed="false"
          style="margin-bottom: 5px; margin: 5px;" 
          
        >{{ lista_mesas.nombre }}
        </button>
      </div>
      <br>
    </div>
    <div v-for="venta in ventas" v-bind:key="venta.id" class="col-md-6">
      <div class="main-card mb-3 card">
        <div class="card-header">
          <h3><b>{{ venta.mesa_id_pk.nombre }}</b></h3>
          <div class="btn-actions-pane-right">
            <div role="group" class="btn-group-sm btn-group">
             
              <button @click="cobra_todo(venta.id)" class="btn btn-focus">Cerrar</button>
            </div>
          </div>
        </div>
        <div class="table-responsive">
          <table class="align-middle mb-0 table table-borderless table-striped table-hover">
            <thead>
              <tr>
                <th>Productos</th>
                <th class="text-center">Cantidad</th>
                <th class="text-center">Total</th>
                <th class="text-center">Acciones</th>
              </tr>
            </thead>
            <tbody>
              <tr v-for="producto in venta.ventas_has_producto_all" v-bind:key="producto.id">
                <td>
                  <div class="widget-content p-0">
                    <div class="widget-content-wrapper">
                      <div class="widget-content-left mr-3">
                        <div class="widget-content-left">
                          <img
                            width="40"
                            class="rounded-circle"
                            v-bind:src="'perfil_usuario/' + producto.producto_id_pk.imagen"
                          >
                        </div>
                      </div>
                      <vue-single-select
                        v-if="editar_producto && producto.id == actualiza_id"
                        v-model="actualiza_producto_id"
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

                      <div v-else class="widget-content-left flex2">
                        <div class="widget-heading">{{ producto.producto_id_pk.nombre }}</div>
                        <div
                          class="widget-subheading opacity-7"
                        >{{ formatPrice(producto.producto_id_pk.precio_venta) }}</div>
                      </div>
                    </div>
                  </div>
                </td>

                <td v-if="editar_producto && producto.id == actualiza_id" class="text-center">
                  <input
                    type="number"
                    name="cantidad"
                    class="form-control"
                    value="1"
                    required="required"
                    autofocus
                    v-model="actualiza_cantidad"
                  >
                </td>
                <td v-else class="text-center">{{ producto.cantidad }}</td>
                <td class="text-center">
                  <div class="font-size-xlg text-muted">
                    <small class="opacity-5 pr-1">$</small>
                    <span>{{ formatPrice(producto.cantidad*producto.producto_id_pk.precio_venta) }}</span>
                    <small class="text-warning pl-2">
                      <i class="fa fa-dot-circle"></i>
                    </small>
                  </div>
                </td>

                <td class="text-center" v-if="editar_producto && producto.id == actualiza_id">
                  <button @click="post_editar_producto()" class="btn btn-info btn-sm">Modificar</button>
                  <button @click="cancelar_editar_producto()" class="btn btn-danger btn-sm">Cancelar</button>
                </td>
                <td class="text-center" v-else>
                  <button @click="Editar_producto(producto)" class="btn btn-info btn-sm">Editar</button>
                  <button @click="duplicar_producto(producto.producto_id_pk.id,venta.id,producto.cantidad)" class="btn btn-success btn-sm">Duplicar Productos</button>
                  <button @click="Eliminar_producto(producto.id)" class="btn btn-danger btn-sm" >Eliminar</button>
                </td>
              </tr>
              <tr>
                <th>Total</th>
                <td></td>
                <th class="text-center">
                  <div class="font-size-xlg text-muted">
                    <small class="opacity-5 pr-1">$</small>
                    <span>{{ formatPrice(venta.total_ventas) }}</span>
                    <small class="text-warning pl-2">
                      <i class="fa fa-dot-circle"></i>
                    </small>
                  </div>
                </th>
                <td></td>
              </tr>
            </tbody>
          </table>
        </div>
        <div class="d-block text-center card-footer">
          <form class="form-inline" action v-on:submit.prevent="newproducto(venta.id)">
            <div class="mb-2 mr-sm-2 mb-sm-0 position-relative form-group">
              <label for="exampleEmail22" class="mr-sm-2">Productos</label>

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
            <div class="mb-2 mr-sm-2 mb-sm-0 position-relative form-group">
              <label for="examplePassword22" class="mr-sm-2">Cantidad</label>
              <input
                type="number"
                name="cantidad"
                class="form-control"
                value="1"
                min="1" 
                required="required"
                autofocus
                v-model="cantidad"
              >
            </div>
            <button type=button class="btn-wide btn btn-info" @click="cantidad_max_min(1)">+</button>
            <button type=button class="btn-wide btn btn-info" @click="cantidad_max_min(0)">-</button>
            <button class="btn-wide btn btn-success" style="margin-left: 10px;" >Añadir</button>
          </form>
        </div>
      </div>
    </div>
  </div>
  </div>
  <!--
  <script src="https://unpkg.com/vue/dist/vue.js"></script>
  <script src="https://unpkg.com/vue-toastr-2/dist/vue-toastr-2.js"></script>
  <link rel="stylesheet" href="https://unpkg.com/vue-toastr-2/dist/vue-toastr-2.min.css">
  -->
</template> 
<script type="application/javascript">
import Vue from "vue";
import VueSingleSelect from "vue-single-select";

//import VueToast from "vue-toast-notification";
//import "vue-toast-notification/dist/index.css";

//https://www.npmjs.com/package/vue-toastr-2
import VueToastr2 from "vue-toastr-2";
import "vue-toastr-2/dist/vue-toastr-2.min.css";
window.toastr = require("toastr");
Vue.use(VueToastr2);

export default {
  data() {
    venta_id: "";
    operacion: "";
    //form para actualizar

    actualiza_producto_id: "";
    actualiza_cantidad: "";

    return {
      editar_producto: false,
      ventas: [],
      thoughts: [],
      thought: [],
      venta: [],
      actualiza_id: "",
      producto_id: "",
      cantidad: "1",
      productos_all: [],
      lista_mesa: []
    };
  },
  mounted() {
    this.fetchArticles();
    axios.get("productos_all").then(response => {
      this.productos_all = response.data;
    });
    axios.get("mesa/lista_mesa").then(response => {
      this.lista_mesa = response.data;
    });
  },
  components: {
    VueSingleSelect,
    VueToastr2
  },
  methods: {
    formatPrice(value) {
      let val = (value / 1).toFixed(0).replace(".", ",");
      return val.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ".");
    },
    cantidad_max_min(valor_unidad){
      if(valor_unidad==1){
        this.cantidad++;
      }else{
        this.cantidad--;
      }
      
    },
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
      if (confirm("Esta seguro que desea eliminar?")) {
        const params = {
          _token: "sweedee"
        };
        axios.delete(`ventas_has_producto/${id}`, params).then(response => {
          const venta = response.data;
          console.info(response.data);
          this.fetchArticles();
        });
      }
    },
    cobra_todo(venta_id) {
      axios
        .post(`ventas_has_producto/cobra_todo/${venta_id}`)
        .then(response => {
          const venta = response.data;
          console.info(response.data);
          this.fetchArticles();
        });
    },
    duplicar_producto(producto_id,venta_id,cantidad){
      //axios
        //.post(`ventas_has_producto/duplicar_productos`)
      const params = {
        producto_id: producto_id,
        ventas_id: venta_id,
        cantidad: cantidad
      };
      axios
        .post(`ventas_has_producto/duplicar_productos`, params)
        .then(response => {
          const venta = response.data;
          this.fetchArticles();
        });
    },
    Editar_producto(producto) {
      this.editar_producto = true;
      console.info(producto);

      //alert(producto.producto_id_pk.nombre);
      this.actualiza_id = producto.id;
      this.actualiza_producto_id = producto.producto_id_pk;
      this.actualiza_cantidad = producto.cantidad;
    },
    lista_mesa_add(mesa_id) {
      axios
        .get(`ventas_has_producto/lista_mesa_add/${mesa_id}`)
        .then(response => {
          const venta = response.data;

          if (venta.nombre == false) {
            this.$toastr.info("mesa ocupada", "mesa creada");
          } else {
            this.$toastr.success("mesa creada con exito", "mesa creada");
          }
          this.fetchArticles();
          //Vue.use(VueToast);
          /*
          newFunction().success("mesa creado con exito", {
            // override the global option
            position: "top-right",
            duration: 10000,
            queue: true
          });
          */
        });
    },
    post_editar_producto() {
      this.editar_producto = false;

      const params = {
        id: this.actualiza_id,
        producto_id: this.actualiza_producto_id.id,
        cantidad: this.actualiza_cantidad
      };
      axios
        .put(`ventas_has_producto/${this.actualiza_id}`, params)
        .then(response => {
          const venta = response.data;

          this.fetchArticles();
        });
    },
    cancelar_editar_producto() {
      this.editar_producto = false;
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
      this.producto_id = "";
      this.cantidad = 1;
      //this.ventas_id = '';
      axios.post("ventas_has_producto", params).then(response => {
        const venta = response.data;

        this.fetchArticles();
      });
    },
    clearForm() {
      //this.edit = false;
      this.producto_id.id = null;
      this.this.cantidad = 1;
      //this.article.title = '';
    }
  }
};

function newFunction() {
  return Vue.$toast;
}
</script>