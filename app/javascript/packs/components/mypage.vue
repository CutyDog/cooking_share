<template>
  <div class="mypage">
    {{ name }}
    <button v-on:click="logout()">Log Out</button>
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