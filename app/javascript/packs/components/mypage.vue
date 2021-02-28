<template>
  <div class="mypage">
    <div class="container">
      <div class="row" style="padding:30px;">
        <div class="row">
          <div class="col s6">
            <p><i class="material-icons">person_outline</i>{{ name }}</p>
          </div>
          <div class="col s6">
            <button class="waves-effect waves-light btn" v-on:click="logout()">Log Out</button>
          </div>
        </div>  
        <div v-for="post in posts" v-bind:id="'row_post_' + post.id" class="col s12">
          <div v-bind:id="'post_' + post.id" class="card-panel grey lighten-5 z-depth-1">
            <div class="row valign-wrapper">
              <div class="col s2">
                <img v-if="post.img.url" src="post.image.url" alt="" class="circle responsive-img">
                <img v-else src="../../../assets/images/sample1.jpg" alt="" class="circle responsive-img">
              </div>
              <div class="col s10">
                <span class="black-title" style="font-weight:bold">{{post.title}}</span>
                <br></br>
                <span class="black-text">{{post.text}}</span>
              </div>
            </div>
          </div>
        </div>  
      </div>  
    </div>
      
    </div>
  </div>  
</template>

<script>
const axios = require("axios");

export default {
  name: "MyPage",
  components: {},
  data: function () {
    return {
      name: "",
    };
  },
  methods: {
    getLogIn: async function () {
      const self = this;
      const result = await axios
        .get("/api/user/log_in", {
          withCredentials: true,
        })
        .catch(function () {
          self.$router.push("../log_in");
          return;
        });

      if (result === undefined) {
        return;
      }

      if (result.data.state != "success") {
        this.$router.push("../log_in");
        return;
      }

      this.name = result.data.log_in.name;
    },
    logout: async function () {
      const self = this;
      const result = await axios
        .post("/api/user/log_out", {
          withCredentials: true,
        })
        .then(response => {
          self.$router.push("../log_in");
        })
        .catch(function () {
          self.$router.push("../log_in");
        });
    },   
  },
  mounted: async function () {
    await this.getLogIn();
  },
};
</script>