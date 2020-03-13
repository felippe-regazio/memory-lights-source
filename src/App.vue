<template>
  <div id="app">
    <router-view/>
  </div>
</template>

<style lang="scss">
  html, body {
    font-family: Arial, Helvetica, sans-serif;
    * {
      box-sizing: border-box;
    }
    .container {
      max-width: 600px;
      width: 100%;
      position: relative;
      margin: 0 auto; 
    }
  }
</style>