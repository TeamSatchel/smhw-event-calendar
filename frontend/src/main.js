import Vue from 'vue'
import './plugins/vuetify'
import App from './App.vue'
import router from './router'
import store from './store'
import 'roboto-fontface/css/roboto/roboto-fontface.css'
import '@mdi/font/css/materialdesignicons.css'
import axios from 'axios'

Vue.config.productionTip = false

if (process.env.NODE_ENV !== 'production') {
  axios.defaults.baseURL = 'http://localhost:3000'
}

new Vue({
  router,
  store,
  render: h => h(App)
}).$mount('#app')
