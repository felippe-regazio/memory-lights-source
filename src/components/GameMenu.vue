<template>
    <div class="game-menu">
        <div class="playing-menu" v-if="started">
            <game-hits/>
            <game-timer/>
        </div>
        <div class="start-menu" v-else>
            <button @click="start">Start</button>
        </div>
    </div>
</template>

<script>

import GameHits from '@/components/GameMenu/GameHits.vue'
import GameTimer from '@/components/GameMenu/GameTimer.vue'


export default {
    name: 'game-menu',
    components: {
        GameHits,
        GameTimer
    },
    data () {
        return {
            started: this.$store.state.started
        }
    },
    methods: {
        start () {
            this.started = true;
            setTimeout(() => {
                window.$gamelights.levelUp();
            }, 500);
        }
    }
}
</script>

<style lang="scss" scoped>
.game-menu {
    background-color: #ffffff;
    border-radius: 8px;
    min-height: 80px;
    .playing-menu {
        display: flex;
        align-items: center;
        justify-content: space-between;
        padding: 8px;
        height: 80px;
        flex-wrap: wrap;
    }
    .start-menu {
        display: flex;
        align-items: center;
        justify-content: center;
        min-height: 80px;
        height: 100%;
        button {
            background-color: #ffffff;
            border: none;
            outline: none;
            padding: 10px 40px;
            border-radius: 25px;
            text-transform: uppercase;
            font-weight: 700;
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