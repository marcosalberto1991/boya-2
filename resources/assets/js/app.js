
require('./bootstrap');

window.Vue = require('vue');
//ss  
Vue.component('listamesa-component', require('./components/ListamesaComponent.vue'));
Vue.component('ayuda-component', require('./components/AyudaComponent.vue'));
Vue.component('formmesa-component', require('./components/formmesaComponent.vue'));
Vue.component('mylistamesa-component', require('./components/mylistamesaComponent.vue'));
 
Vue.component('my-thoughts-component', require('./components/MyThoughtsComponent.vue'));
Vue.component('form-component', require('./components/FormComponent.vue'));
Vue.component('thought-component', require('./components/ThoughtComponent.vue'));
Vue.component('null-component', require('./components/nullComponent.vue'));


const app = new Vue({
    el: '#app'
});
