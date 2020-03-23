<template>
    <div class="game-over">
        <div class="game-over__content">
            <h4>game over</h4>
            <button @click="restart">Restart</button>
        </div>
    </div>
</template>

<script>
export default {
    name: 'game-over',
    methods: {
        restart () {
            window.$gamelights.restart()
        }
    }
}
</script>

<style lang="scss" scoped>
.game-over {
    position: absolute;
    top: 0;
    left: 0;
    background-color: rgba(255,255,255,.95);
    width: 100%;
    height: 100%;
    display: flex;
    align-items: center;
    justify-content: center;
    &__content {
        text-align: center;
        h4 {
            text-transform: uppercase;
            color: red;
        }
        button {
            background-color: #ffffff;
            border: none;
            outline: none;
            padding: 10px 40px;
            border-radius: 25px;
            text-transform: uppercase;
            font-weight: 700;
            font-size: 12px;
            cursor: pointer;
            color: #000000;
            border: dashed 2px #000000;
            transition: 200ms;
            &:hover {
                background-color: #ffa500;
            }
        }
    }
}
</style>