import { createApp } from 'vue'
import App from './App.vue'
import router from './router'

// Vuetify
import 'vuetify/styles'
import { createVuetify } from 'vuetify'
import { aliases, mdi } from 'vuetify/iconsets/mdi'
import * as components from 'vuetify/components'
import * as directives from 'vuetify/directives'
import * as labsComponents from 'vuetify/labs/components'

// mdi icons
import '@mdi/font/css/materialdesignicons.css'; // Import the default Material Design Icons font

const vuetify = createVuetify({
   components: {
      ...components,
      ...labsComponents,
   },
  directives,
  icons: {
    defaultSet: 'mdi',
    aliases,
    sets: {
      mdi,
    },
  },
})

const app = createApp(App).use(vuetify)

app.use(router)

app.mount('#app')
