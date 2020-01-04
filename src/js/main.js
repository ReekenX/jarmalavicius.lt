import Vue from 'vue';
import CollapseMenu from './components/CollapseMenu'
import MobileMenu from './components/MobileMenu'

Vue.component('collapseMenu', CollapseMenu)
Vue.component('mobileMenu', MobileMenu)

const app = new Vue({
  el: '#app',
})
