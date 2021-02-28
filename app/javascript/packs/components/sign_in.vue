<template>
  <div class="sign_in">
    Sign In
    <div>
      <div>{{ name }}</div>
      <input type="string" v-model="name" placeholder="NAME" /><br />
      <input type="string" v-model="password" placeholder="PASSWORD" /><br />
      <button v-on:click="signin()">SIGNIN</button>
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