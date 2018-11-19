<template>
    <header>
        <h1
            class="title"
            @click="backToTop"
        >
            MY FAVORITE MOVIES
        </h1>
    </header>
</template>

<script>
export default {
  methods: {
    backToTop() {
      this.$router.push("/");
      window.scrollTo(0, 0);
    }
  }
};
</script>

<style lang="scss" scoped>
header {
  height: 60px;
  display: flex;
  align-items: center;
  font-size: 20px;
  padding: 0 16px;
  position: fixed;
  top: 0;
  left: 0;
  right: 0;

  .title {
    font-size: 20px;
    cursor: pointer;
  }
}
</style>
