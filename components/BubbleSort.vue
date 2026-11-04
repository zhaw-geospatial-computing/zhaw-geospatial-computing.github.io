<script setup>
import { ref, computed } from 'vue'

// Each step: current array state, which indices are being compared (hi),
// which indices are permanently placed (done), and a label.
// Array: [C, A, G, B, D, H, E, F] — the lecture example (letters A–H shuffled)
const steps = [
  // Pass 1
  { arr: ['C','A','G','B','D','H','E','F'], hi: [0,1], done: [],     label: 'Pass 1: compare C and A' },
  { arr: ['A','C','G','B','D','H','E','F'], hi: [1,2], done: [],     label: 'C > A → swap. Compare C and G' },
  { arr: ['A','C','G','B','D','H','E','F'], hi: [2,3], done: [],     label: 'C < G → no swap. Compare G and B' },
  { arr: ['A','C','B','G','D','H','E','F'], hi: [3,4], done: [],     label: 'G > B → swap. Compare G and D' },
  { arr: ['A','C','B','D','G','H','E','F'], hi: [4,5], done: [],     label: 'G > D → swap. Compare G and H' },
  { arr: ['A','C','B','D','G','H','E','F'], hi: [5,6], done: [],     label: 'G < H → no swap. Compare H and E' },
  { arr: ['A','C','B','D','G','E','H','F'], hi: [6,7], done: [],     label: 'H > E → swap. Compare H and F' },
  // H bubbles to end
  { arr: ['A','C','B','D','G','E','F','H'], hi: [0,1], done: [7],   label: 'H > F → swap. H is placed! Pass 2: compare A and C' },
  // Pass 2
  { arr: ['A','C','B','D','G','E','F','H'], hi: [1,2], done: [7],   label: 'A < C → no swap. Compare C and B' },
  { arr: ['A','B','C','D','G','E','F','H'], hi: [2,3], done: [7],   label: 'C > B → swap. Compare C and D' },
  { arr: ['A','B','C','D','G','E','F','H'], hi: [3,4], done: [7],   label: 'C < D → no swap. Compare D and G' },
  { arr: ['A','B','C','D','G','E','F','H'], hi: [4,5], done: [7],   label: 'D < G → no swap. Compare G and E' },
  { arr: ['A','B','C','D','E','G','F','H'], hi: [5,6], done: [7],   label: 'G > E → swap. Compare G and F' },
  // G bubbles to end of unsorted region
  { arr: ['A','B','C','D','E','F','G','H'], hi: [],    done: [6,7], label: 'G > F → swap. Sorted ✓' },
]

const i = ref(0)
const step = computed(() => steps[i.value])

function advance() { if (i.value < steps.length - 1) i.value++ }
function reset() { i.value = 0 }

function itemClass(idx) {
  if (step.value.done.includes(idx))
    return 'bg-green-100 border-green-400 text-green-700'
  if (step.value.hi.includes(idx))
    return 'bg-amber-100 border-amber-400 text-amber-700'
  return 'bg-slate-100 border-slate-300 text-slate-600'
}
</script>

<template>
  <div class="flex flex-col items-center gap-6 select-none">

    <TransitionGroup name="sort" tag="div" class="flex gap-4 items-center">
      <div
        v-for="(item, idx) in step.arr"
        :key="item"
        class="w-16 h-16 flex items-center justify-center text-2xl font-bold rounded-xl border-2 transition-colors duration-200"
        :class="itemClass(idx)"
      >
        {{ item }}
      </div>
    </TransitionGroup>

    <p class="text-sm text-slate-500 h-5 italic">{{ step.label }}</p>

    <div class="flex items-center gap-4">
      <button
        class="px-3 py-1 text-sm rounded border border-slate-300 hover:bg-slate-100 transition-colors cursor-pointer"
        @click.stop="reset"
      >
        ↺
      </button>
      <span class="text-xs text-slate-400">{{ i + 1 }} / {{ steps.length }}</span>
      <button
        class="px-4 py-1 text-sm rounded bg-slate-700 text-white hover:bg-slate-600 disabled:opacity-30 disabled:cursor-not-allowed transition-colors cursor-pointer"
        :disabled="i >= steps.length - 1"
        @click.stop="advance"
      >
        Next →
      </button>
    </div>

  </div>
</template>

<style scoped>
/* Animate position changes (swaps) using FLIP */
.sort-move {
  transition: transform 0.6s cubic-bezier(0.25, 0.46, 0.45, 0.94);
}
</style>
