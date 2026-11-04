<script setup>
import { ref } from 'vue'

// Each level: phase (split|merge), groups of letters, label shown on the left
const levels = [
  { phase: 'split', label: '',        groups: [['C','A','G','B','D','H','E','F']] },
  { phase: 'split', label: 'split ↓', groups: [['C','A','G','B'], ['D','H','E','F']] },
  { phase: 'split', label: 'split ↓', groups: [['C','A'], ['G','B'], ['D','H'], ['E','F']] },
  { phase: 'split', label: 'split ↓', groups: [['C'],['A'],['G'],['B'],['D'],['H'],['E'],['F']] },
  { phase: 'merge', label: 'merge ↑', groups: [['A','C'], ['B','G'], ['D','H'], ['E','F']] },
  { phase: 'merge', label: 'merge ↑', groups: [['A','B','C','G'], ['D','E','F','H']] },
  { phase: 'merge', label: 'merge ↑', groups: [['A','B','C','D','E','F','G','H']] },
]

const shown = ref(1)
function advance() { if (shown.value < levels.length) shown.value++ }
function reset() { shown.value = 1 }
</script>

<template>
  <div class="flex flex-col gap-1.5 select-none">

    <template v-for="(level, li) in levels" :key="li">

      <!-- Dashed separator between split and merge phases -->
      <div
        v-if="li === 4 && shown > 4"
        class="border-t border-dashed border-slate-300 my-0.5"
      />

      <Transition name="row">
        <div v-if="li < shown" class="flex items-center gap-3">

          <!-- Phase label -->
          <span
            class="text-xs font-mono w-16 shrink-0 text-right"
            :class="level.phase === 'split' ? 'text-slate-400' : 'text-emerald-500'"
          >{{ level.label }}</span>

          <!-- Groups row — justify-around so groups spread symmetrically -->
          <div class="flex flex-1 justify-around items-center">
            <div
              v-for="(group, gi) in level.groups"
              :key="gi"
              class="flex gap-1 px-1.5 py-1 rounded-lg ring-1"
              :class="level.phase === 'split'
                ? 'bg-sky-50 ring-sky-200'
                : li === levels.length - 1
                  ? 'bg-emerald-100 ring-emerald-400'
                  : 'bg-emerald-50 ring-emerald-200'"
            >
              <div
                v-for="item in group"
                :key="item"
                class="w-8 h-8 flex items-center justify-center text-sm font-bold rounded border"
                :class="level.phase === 'split'
                  ? 'bg-sky-100 border-sky-300 text-sky-800'
                  : li === levels.length - 1
                    ? 'bg-emerald-200 border-emerald-400 text-emerald-900'
                    : 'bg-emerald-100 border-emerald-300 text-emerald-800'"
              >{{ item }}</div>
            </div>
          </div>

        </div>
      </Transition>

    </template>

    <!-- Controls -->
    <div class="flex items-center justify-center gap-4 mt-3">
      <button
        class="px-2 py-1 text-xs rounded border border-slate-300 hover:bg-slate-100 transition-colors cursor-pointer"
        @click.stop="reset"
      >↺</button>
      <span class="text-xs text-slate-400">{{ shown }} / {{ levels.length }}</span>
      <button
        class="px-3 py-1 text-xs rounded bg-slate-700 text-white hover:bg-slate-600 disabled:opacity-30 disabled:cursor-not-allowed transition-colors cursor-pointer"
        :disabled="shown >= levels.length"
        @click.stop="advance"
      >Next →</button>
    </div>

  </div>
</template>

<style scoped>
.row-enter-active {
  transition: opacity 0.35s ease, transform 0.35s ease;
}
.row-enter-from {
  opacity: 0;
  transform: translateY(-6px);
}
</style>
