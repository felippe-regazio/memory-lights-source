<template>
    <div class="game-level">
        <h1>⚡ lv {{level}}</h1>
    </div>
</template>

<script>
export default {
    name: 'game-level',
    computed: {
        level () {
            return this.$store.state.level
        }
    }
}
</script>

<style lang="scss" scoped>
    .game-level h1 {
        color: #444;
        font-size: var(--base-font);
        text-transform: lowercase;
        letter-spacing: 10px;
        font-weight: 400;
    }
</style>