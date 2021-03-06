import Vue from 'vue'
import App from './App.vue'
import * as VueGoogleMaps from 'vue2-google-maps'
import vuetify from './plugins/vuetify';
import VueTour from 'vue-tour'

require('vue-tour/dist/vue-tour.css')

Vue.use(VueTour)

Vue.use(VueGoogleMaps, {
  load: {
    key: 'AIzaSyCSxdhnGcz18Iuv1vt7JKEO4YegSM49A3g',
    libraries: 'drawing',
  },
  installComponents: true,
})

Vue.config.productionTip = false

new Vue({
  vuetify,
  render: h => h(App)
}).$mount('#app')
