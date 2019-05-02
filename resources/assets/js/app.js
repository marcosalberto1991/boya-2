
require('./bootstrap');

window.Vue = require('vue');
//ss
Vue.component('ayuda-component', require('./components/AyudaComponent.vue'));
 
const app = new Vue({
    el: '#app'
});
