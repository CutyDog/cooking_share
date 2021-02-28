<template>
  <div class="container">
    <div class="row" style="padding:30px;">
      <form class="col s12">
        <div class="row">
          <div class="input-field col s12">
            <input id="title" type="text" class="validate">
            <label for="title">title</label>
          </div>
        </div>
        <div class="row">
          <div class="input-field col s12">
            <input id="description" type="text" class="validate">
            <label for="description">Add description</label>
          </div>
        </div>
        <div class="file-field input-field">
          <div class="btn">
            <span>Picture</span>
            <input type="file" multiple>
          </div>
          <div class="file-path-wrapper">
            <input class="file-path validate" type="text" placeholder="Upload one or more files">
          </div>
        </div>
        <div class="col s12 offset-s4">
        <button class="btn waves-effect waves-light " type="submit" name="action">Submit
          <i class="material-icons right">send</i>
        </button>  
        </div>
      </form>
    </div>
    <input v-model="user_id" class="form-control" placeholder="User ID">
    <input v-model="title" class="form-control" placeholder="Add Title">
    <input v-model="text" class="form-control" placeholder="Add Text">
    <div v-on:click="createPost" class="btn-floating waves-effect waves-light red">POST</div>
  </div>  
</template>


<script>
import axios from 'axios';

export default {
  data: function () {
    return {
      posts: [],
      title: '',
      text: '',
      user_id: '',
    }
  },
  mounted: function () {
    this.fetchPosts();
  },  
  methods: {
    
    createPost: function () {
      if (!this.title) return;
          
      axios.post('/api/posts', {
        post: { 
          title: this.title,
          text: this.text,
          user_id: this.user_id,
        }, 
      })
      .then((response) => {
        this.posts.unshift(response.data.post);
        this.newPost = '';
      }, (error) => {
        console.log(error);
      });
    }, 
  },
}  
</script>