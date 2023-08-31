import { createRouter, createWebHistory } from 'vue-router'
import HivesIndex from '../views/HivesIndex.vue'
import HiveShow from '../views/HiveShow.vue'

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {
      path: '/',
      name: 'hives',
      component: HivesIndex
    },
    {
      path: '/hives/:id',
      name: 'hive detail',
      component: HiveShow
    }
  ]
})

export default router
