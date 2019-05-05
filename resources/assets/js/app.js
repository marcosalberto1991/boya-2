
require('./bootstrap');

window.Vue = require('vue');
//ss  
Vue.component('ayuda-component', require('./components/AyudaComponent.vue'));
Vue.component('lista_mesa-component', require('./components/lista_mesaComponent.vue'));
 
const app = new Vue({
    el: '#app'
});
