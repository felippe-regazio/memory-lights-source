<template>
    <div class="game-level">
        <h1>{{level}}</h1>
    </div>
</template>

<script>
export default {
    name: 'game-level',
    computed: {
        level () {
            return `⚡ XP ${this.$store.state.level}`
        }
    }
}
</script>

<style lang="scss" scoped>
    .game-level h1 {
        color: #444;
        font-size: 30px;
        text-transform: lowercase;
        letter-spacing: 10px;
        font-weight: 400;
    }
</style>