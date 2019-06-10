<template>
  <div class="row">
    <div v-for="venta in ventas" v-bind:key="venta.id" class="col-md-6">
      <div class="main-card mb-3 card">
        <div class="card-header">
          {{ venta.mesa_id_pk.nombre }}
          <div class="btn-actions-pane-right">
            <div role="group" class="btn-group-sm btn-group">
              <button class="active btn btn-focus">Last Week</button>
              <button class="btn btn-focus">All Month</button>
            </div>
          </div>
        </div>
        <div class="table-responsive">
          <table class="align-middle mb-0 table table-borderless table-striped table-hover">
            <thead>
              <tr>
                <!--
                <th class="text-center">#</th>
                -->
                <th>Productos</th>
                <th class="text-center">Cantidad</th>
                <th class="text-center">Status</th>
                <th class="text-center">Actions</th>
              </tr>
            </thead>
            <tbody>
              <tr v-for="producto in venta.ventas_has_producto_all" v-bind:key="producto.id">
                <!--
                <td class="text-center text-muted">#345</td>
                -->
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
                      <div class="widget-content-left flex2">
                        <div class="widget-heading">{{ producto.producto_id_pk.nombre }}</div>
                        <div
                          class="widget-subheading opacity-7"
                        >{{ formatPrice(producto.producto_id_pk.precio_venta) }}</div>
                      </div>
                    </div>
                  </div>
                </td>
                <td class="text-center">{{ producto.cantidad }}</td>
                <td class="text-center">
                  <div class="font-size-xlg text-muted">
                    <small class="opacity-5 pr-1">$</small>
                    <span>{{ formatPrice(producto.cantidad*producto.producto_id_pk.precio_venta) }}</span>
                    <small class="text-warning pl-2">
                      <i class="fa fa-dot-circle"></i>
                    </small>
                  </div>
                </td>

                <td class="text-center">
                  <button @click="Editar_producto(producto)" class="btn btn-info btn-sm">Editar</button>
                  <button
                    @click="Eliminar_producto(producto.id)"
                    class="btn btn-danger btn-sm"
                  >Eliminar</button>
                  <!--
                  <button type="button" class="btn btn-primary" data-toggle="tooltip" data-placement="left" title="" data-original-title="Tooltip on left" aria-describedby="tooltip961262">
                      Tooltip on left
                  </button>
                  -->
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
                required="required"
                autofocus
                v-model="cantidad"
              >
            </div>
            <button class="btn-wide btn btn-success">Guarda</button>
          </form>
        </div>
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
    formatPrice(value) {
      let val = (value / 1).toFixed(0).replace(".", ",");
      return val.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ".");
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
      if (confirm("Are You Sure?")) {
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
    Editar_producto(producto) {
      fetch("ventas_has_producto", {
        method: "put",
        body: JSON.stringify(this.producto),
        headers: {
          "content-type": "application/json"
        }
      })
        .then(res => res.json())
        .then(data => {
          this.clearForm();
          alert("Article Updated");
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
      this.producto_id = '';
      this.cantidad = '';
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
</script>