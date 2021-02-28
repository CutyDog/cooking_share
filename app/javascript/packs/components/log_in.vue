<template>
  <div class="log_in">
    <div class="container">
      <div class="row" style="padding-top:20px;">
        <div class="col s12">
          <p>Log In Page</p>
        </div>
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
        <div class="row">
          <div class="col s12 offset-s4">
            <button v-on:click="login()" class="btn waves-effect waves-light" name="action">
              Log In
            </button>  
          </div>
        </div>
        <div class="row">
          <div class="col s12">
            <br></br>
            <p>Sing In Page is below</p>
          </div>
          <div class="col s12 offset-s4">
            <router-link to="/sign_in">
              <button class="btn waves-effect waves-light pink lighten-2">Sign In</button>
            </router-link>
          </div>
        </div>
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
        .then(response => {
          this.$router.push("../mypage");
        })
        .catch(function () {
          self.message = "入力エラー";
        });

    },
  },
};
</script>