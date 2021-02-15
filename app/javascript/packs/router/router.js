import Vue from 'vue/dist/vue.esm.js'
import VueRouter from 'vue-router'
import Index from '../components/main.vue'
import Post from '../components/post.vue'
import Mypage from '../components/mypage.vue'
import Search from '../components/search.vue'

Vue.use(VueRouter)

export default new VueRouter({
  mode: 'history',
  routes: [
    { path: '/', component: Index },
    { path: '/post', component: Post },
    { path: '/mypage', component: Mypage },
    { path: '/search', component: Search },
  ],
})