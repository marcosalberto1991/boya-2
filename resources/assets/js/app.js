require('./bootstrap');

window.Vue = require('vue');

/*
 */
import Vue from 'vue';
import VueToastr2 from 'vue-toastr-2';
import 'vue-toastr-2/dist/vue-toastr-2.min.css';


import BootstrapVue from 'bootstrap-vue' //https://bootstrap-vue.js.org/
import 'bootstrap/dist/css/bootstrap.css'
import 'bootstrap-vue/dist/bootstrap-vue.css'
import vuejquery from 'vue-jquery';
import DatePicker from 'vue2-datepicker'

import Multiselect from 'vue-multiselect' //https://vue-multiselect.js.org/
//import Datepicker from 'vuejs-datepicker';
//import DatePicker from 'vue2-datepicker'

Vue.component('multiselect', Multiselect)
    //import Permissions from './mixins/Permissions';
    //Vue.mixin(Permissions);
Vue.use(BootstrapVue)
window.$ = window.jQuery = require('jquery')

window.toastr = require('toastr');
Vue.use(VueToastr2);

//import CKEditor from '@ckeditor/ckeditor5-vue';
//Vue.use(CKEditor);

/*
 */
//import Vue from 'vue';
//import VueToastr2 from 'vue-toastr-2';
//import 'vue-toastr-2/dist/vue-toastr-2.min.css';


//import BootstrapVue from 'bootstrap-vue' //https://bootstrap-vue.js.org/
//import 'bootstrap/dist/css/bootstrap.css'
//import 'bootstrap-vue/dist/bootstrap-vue.css'


//Vue.use(BootstrapVue);


//Vue.component('multiselect', Multiselect)
//import Permissions from './mixins/Permissions';
//Vue.mixin(Permissions);
Vue.use(BootstrapVue)




//window.toastr = require('toastr');
//Vue.use(VueToastr2);

//Vue.component('listamesa-component', require('./components/ListamesaComponent.vue'));
//Vue.component('ayuda-component', require('./components/AyudaComponent.vue'));
//Vue.component('formmesa-component', require('./components/formmesaComponent.vue'));
//Vue.component('mylistamesa-component', require('./components/mylistamesaComponent.vue'));
Vue.component('my-thoughts-component', require('./components/MyThoughtsComponent.vue'));
//Vue.component('form-component', require('./components/FormComponent.vue'));
//Vue.component('thought-component', require('./components/ThoughtComponent.vue'));
//Vue.component('null-component', require('./components/nullComponent.vue'));
//Vue.component('punto-component', require('./components/puntoComponent.vue'));
//Vue.component('mesa-component', require('./components/mesaComponent.vue'));
Vue.component('vue-producto', require('./components/vue-Producto.vue'));

Vue.component('vue-ventas', require('./components/vue-Ventas.vue'));

Vue.component('vue-factura', require('./components/vue-Factura.vue'));
Vue.component('pagination', require('laravel-vue-pagination')); //https://www.npmjs.com/package/laravel-vue-pagination

const app = new Vue({
    el: '#app_vue',
});