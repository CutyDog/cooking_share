<template>
  <div class="row">
    <div class="col s12" style="margin:20px;">
      This is Top Page
    </div>  
    <div v-for="post in posts" v-bind:id="'row_post_' + post.id" class="col s12">
      <div v-bind:id="'post_' + post.id" class="card-panel grey lighten-5 z-depth-1">
        <div class="row valign-wrapper">
          <div class="col s2">
            <img v-if="post.img.url" src="post.image.url" alt="" class="circle responsive-img">
            <img v-else src="../../../assets/images/sample1.jpg" alt="" class="circle responsive-img">
          </div>
          <div class="col s10">
            <span class="black-title" style="font-weight:bold">{{post.user_id}}</span>
            <br></br>
            <span class="black-title" style="font-weight:bold">{{post.title}}</span>
            <br></br>
            <span class="black-text">{{post.text}}</span>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
  import axios from 'axios';

  export default {
    data: function () {
      return {
        posts: [],
        newPost: ''
      }
    },
    mounted: function () {
      this.fetchPosts();
    },
    methods: {
      fetchPosts: function () {
        axios.get('/api/posts').then((response) => {
          for(var i = 0; i < response.data.posts.length; i++) {
            this.posts.push(response.data.posts[i]);
          }
        }, (error) => {
          console.log(error);
        });
      },
    }
  }
</script>