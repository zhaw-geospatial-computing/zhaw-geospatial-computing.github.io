<script setup>
import { ref, computed, onUnmounted } from 'vue'

const props = defineProps({
  minutes: { type: Number, default: 5 },
  seconds: { type: Number, default: 0 },
})

const total = props.minutes * 60 + props.seconds
const remaining = ref(total)
const running = ref(false)
let timer = null

const mm = computed(() => String(Math.floor(remaining.value / 60)).padStart(2, '0'))
const ss = computed(() => String(remaining.value % 60).padStart(2, '0'))

const color = computed(() => {
  const ratio = remaining.value / total
  if (ratio > 0.5) return '#1a7a1a'
  if (ratio > 0.2) return '#e67e22'
  return '#cc2222'
})

function toggle() {
  if (running.value) {
    clearInterval(timer)
    running.value = false
  } else {
    if (remaining.value === 0) return
    running.value = true
    timer = setInterval(() => {
      if (remaining.value > 0) {
        remaining.value--
      } else {
        clearInterval(timer)
        running.value = false
      }
    }, 1000)
  }
}

function reset() {
  clearInterval(timer)
  running.value = false
  remaining.value = total
}

onUnmounted(() => clearInterval(timer))
</script>

<template>
  <div class="flex flex-col items-center gap-2 mt-4">
    <div class="font-mono font-bold text-6xl tabular-nums" :style="{ color }">
      {{ mm }}:{{ ss }}
    </div>
    <div class="flex gap-2 mt-1">
      <button
        class="px-4 py-1 rounded text-white text-sm font-semibold transition-colors"
        :style="{ background: running ? '#666' : '#1a7a1a' }"
        @click="toggle"
      >
        {{ running ? 'Pause' : remaining < total ? 'Weiter' : 'Start' }}
      </button>
      <button
        class="px-4 py-1 rounded text-white text-sm font-semibold"
        style="background: #555"
        @click="reset"
      >
        Reset
      </button>
    </div>
  </div>
</template>
