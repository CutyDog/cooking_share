<template>
  <div class="sign_in">
    <div class="container">
      <div class="row" style="padding-top:20px;">
        <div class="col s12">
          <p>Sign In Page</p>
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
        <div class="col s12 offset-s4">
          <button v-on:click="signin()" class="btn waves-effect waves-light" name="action">
            Sign In
          </button>  
        </div>
      </div>
    </div> 
  </div>
</template>

<script>
const axios = require("axios");
const qs = require("qs");

export default {
  name: "SignIn",
  components: {},
  data: function () {
    return {
      name: "",
      password: "",
      message: "",
    };
  },
  methods: {
    signin: async function () {
      const self = this;
      const result = await axios
        .post("/api/users", {
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
        this.$router.push("/");
      }
    },
  },
};
</script>