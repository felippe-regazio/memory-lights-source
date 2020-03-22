<template>
    <div class="logo">
        <h1>Memory Lights</h1>
    </div>
</template>

<script>
export default {
    name: 'game-logo'
}
</script>

<style lang="scss" scoped>
    .logo h1 {
        color: #444;
        font-size: 30px;
        text-transform: lowercase;
        letter-spacing: 10px;
        font-weight: 400;
        @media screen and (max-width: 768px) {
            display: none;
        }
    }
</style>