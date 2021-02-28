<template>
  <div class="log_in">
    <div class="container">
      <div class="row">
        <form class="col s12">
          <div class="row">
            <div class="input-field col s12">
              <textarea id="name" v-model="name" class="materialize-textarea"></textarea>
              <label for="name">Name</label>
            </div>
          </div>
          <div class="row">
            <div class="input-field col s12">
              <textarea id="password" v-model="password" class="materialize-textarea"></textarea>
              <label for="password">Password</label>
            </div>
          </div>
          <div class="col s12 offset-s4">
            <button v-on:click="login()" class="btn waves-effect waves-light" name="action">
              Log In
            </button>  
          </div>
          <div class="col s12 offset-s4">
            <router-link to="/sign_in">
              <button class="waves-effect waves-light btn">Sign In</button>
            </router-link>
          </div>
        </form>
      </div>
    </div> 
  </div>
</template>

<script>
const axios = require("axios");
const qs = require("qs");

export default {
  components: {},
  data: function () {
    return {
      name: "",
      password: "",
    };
  },
  methods: {
    login: async function () {
      const self = this;
      const result = await axios
        .post("/api/auth/verification", {
          user: {
            name: this.name,
            password: this.password,
          },
          paramsSerializer: function (params) {
            return qs.stringify(params, { arrayFormat: "brackets" });
          },
        })
        .catch(function () {
          self.message = "入力エラー";
        });

      if (result.data.state == "success") {
        this.$router.push("../mypage.vue");
      }
    },
  },
};
</script>