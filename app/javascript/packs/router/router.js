import Vue from 'vue/dist/vue.esm.js'
import VueRouter from 'vue-router'
import Index from '../components/main.vue'
import Post from '../components/post.vue'
import Mypage from '../components/mypage.vue'
import Search from '../components/search.vue'
import LogIn from '../components/log_in.vue'
import SignIn from '../components/sign_in.vue'

Vue.use(VueRouter)

export default new VueRouter({
  mode: 'history',
  routes: [
    { path: '/', component: Index },
    { path: '/post', component: Post },
    { path: '/mypage', component: Mypage },
    { path: '/search', component: Search },
    { path: '/log_in', component: LogIn },
    { path: '/sign_in', component: SignIn },
  ],
})