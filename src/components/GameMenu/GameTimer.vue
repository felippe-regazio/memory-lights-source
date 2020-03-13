<template>
	<span class="game-timer">{{time}}</span>
</template>

<script>
	export default {
		name: 'game-timer',
		mounted () {
			setInterval(() => this.count(), 1000);
		},
		data () {
			return {
				h: 0, m: 0, s: 0,
				time: "00:00:00",
			}
		},
		methods: {
			count () {
				if (this.$store.state.state === "gameover") {
					this.h = 0;
					this.m = 0;
					this.s = 0;
					this.time = "00:00:00";
					return;
				}
				this.s++;
				if (this.s >= 60) {
					this.s = 0;
					this.m++
				}
				if (this.m >= 60) {
					this.m = 0;
					this.h++;
				}
				this.time = [
					this.h,
					this.m,
					this.s
				].map(val => String(Math.trunc(val)).padStart(2, '0')).join(':');
			}
		}
	}
</script>

<style lang="scss" scoped>
.game-timer {
	font-size: 33px;
	color: #444;
}
</style>