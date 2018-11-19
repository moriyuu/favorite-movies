<template>
  <div>
    <section class="container">
        <logo/>
        <h1 class="title">
          MY FAVORITE MOVIES
        </h1>
        <h2 class="subtitle">
           Thank you for coming to my web site!<br>
           This site will introduce my favorite movies!
        </h2>
        <ul>
          <li v-for="movie in movies" :key="movie.id">
            <img :src="'https://image.tmdb.org/t/p/w500' + movie.backdrop_path" />
            <div class="head">
              <h3>{{ movie.title }}</h3>
              <span class="rate">{{ movie.vote_average }}</span>
            </div>
            <p class="release-date">{{ movie.release_date }}</p>
            <p class="overview">{{ movie.overview }}</p>
          </li>
        </ul>
    </section>

  </div>
</template>

<script>
export default {
  computed: {
    movies() {
      const page = this.$route.query.page || 1;
      const movies = [...this.$store.state.movies];
      return movies.splice((page - 1) * 20, 20);
    }
  }
};
</script>

<style lang="scss" scoped>
.container {
  padding: 80px 0;

  h1 {
    font-size: 40px;
    text-align: center;
  }

  h2 {
    font-size: 24px;
    color: #ccc;
    text-align: center;
  }

  ul {
    width: 70%;
    display: flex;
    flex-wrap: wrap;
    margin: 0 auto;
    padding: 40px 0;

    li {
      width: calc(33.3% - (20px * 2));
      margin: 16px 20px 40px 20px;
      display: flex;
      flex-direction: column;
      background-color: #fff;
      transition: all 0.5s;

      &:hover {
        box-shadow: #ccc 0px 0px 8px 0px;
        padding: 16px;
        width: calc((33.3% - (20px * 2)) + 60px);
        margin: -10px -10px 0 -10px;
        z-index: 100;

        .overview {
          max-height: 1000px;
          height: auto;

          &::before {
            width: 0;
          }
        }
      }

      img {
        width: 100%;
        height: auto;
        margin-bottom: 8px;
      }

      .head {
        position: relative;

        h3 {
          font-size: 18px;
          margin: 8px 0;
          padding-right: 24px;
        }

        .rate {
          position: absolute;
          bottom: 8px;
          right: 0;
          font-size: 13px;
          line-height: 1.5;
          color: #888;
        }
      }

      .release-date {
        font-size: 13px;
        line-height: 1.5;
        color: #888;
        margin-bottom: 0.333em;
      }

      .overview {
        font-size: 14px;
        line-height: 1.5;
        color: #888;
        position: relative;
        max-height: calc(14px * 1.5 * 5);
        height: calc(14px * 1.5 * 5);
        overflow: hidden;
        transition: all 0.5s;

        &::before {
          content: "";
          position: absolute;
          bottom: 0;
          right: 0;
          background-image: linear-gradient(90deg, transparent 0, #fff 70%);
          height: calc(14px * 1.5);
          width: 120px;
        }
      }
    }
  }
}
</style>
