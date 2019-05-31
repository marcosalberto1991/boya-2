
require('./bootstrap');

window.Vue = require('vue');
//ss  
//import Vue from 'vue'
//import vSelect from 'vue-select'
//import VueSingleSelect from "vue-single-select";
//Vue.component('vue-single-select', VueSingleSelect);
 
//Vue.component('v-select', vSelect)
Vue.component('listamesa-component', require('./components/ListamesaComponent.vue'));
Vue.component('ayuda-component', require('./components/AyudaComponent.vue'));
Vue.component('formmesa-component', require('./components/formmesaComponent.vue'));
Vue.component('mylistamesa-component', require('./components/mylistamesaComponent.vue'));
 
Vue.component('my-thoughts-component', require('./components/MyThoughtsComponent.vue'));
Vue.component('form-component', require('./components/FormComponent.vue'));
Vue.component('thought-component', require('./components/ThoughtComponent.vue'));
Vue.component('null-component', require('./components/nullComponent.vue'));
Vue.component('punto-component', require('./components/puntoComponent.vue'));
Vue.component('mesa-component', require('./components/mesaComponent.vue'));

const app = new Vue({
    el: '#app'
});
