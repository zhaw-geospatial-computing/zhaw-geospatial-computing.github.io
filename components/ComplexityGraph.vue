<script setup>
const W = 380, H = 230
const pl = 52, pb = 36, pt = 16, pr = 16
const iw = W - pl - pr
const ih = H - pt - pb

const nMax = 30
const yMax = nMax * nMax  // 900

function sx(n) { return pl + (n / nMax) * iw }
function sy(y) { return pt + (1 - Math.min(y, yMax) / yMax) * ih }

function pathD(fn) {
  const pts = []
  for (let i = 0; i <= 300; i++) {
    const n = (i / 300) * nMax
    const y = fn(n)
    pts.push(`${i === 0 ? 'M' : 'L'}${sx(n).toFixed(1)},${sy(y).toFixed(1)}`)
  }
  return pts.join(' ')
}

const dN2    = pathD(n => n * n)
const dNlogN = pathD(n => n > 0 ? n * Math.log2(n) : 0)

const xTicks = [0, 5, 10, 15, 20, 25, 30]
const yTicks = [0, 200, 400, 600, 800]
</script>

<template>
  <svg :width="W" :height="H" style="overflow: visible">

    <!-- Grid lines -->
    <line v-for="y in yTicks" :key="`gy${y}`"
      :x1="pl" :y1="sy(y)" :x2="W - pr" :y2="sy(y)"
      stroke="#e5e7eb" stroke-width="1" />
    <line v-for="x in xTicks" :key="`gx${x}`"
      :x1="sx(x)" :y1="pt" :x2="sx(x)" :y2="H - pb"
      stroke="#e5e7eb" stroke-width="1" />

    <!-- Axes -->
    <line :x1="pl" :y1="pt" :x2="pl" :y2="H - pb" stroke="#9ca3af" stroke-width="1.5" />
    <line :x1="pl" :y1="H - pb" :x2="W - pr" :y2="H - pb" stroke="#9ca3af" stroke-width="1.5" />

    <!-- X tick labels -->
    <text v-for="x in xTicks.filter(x => x > 0)" :key="`tx${x}`"
      :x="sx(x)" :y="H - pb + 14"
      text-anchor="middle" font-size="10" fill="#6b7280">{{ x }}</text>

    <!-- Y tick labels -->
    <text v-for="y in yTicks.filter(y => y > 0)" :key="`ty${y}`"
      :x="pl - 6" :y="sy(y) + 4"
      text-anchor="end" font-size="10" fill="#6b7280">{{ y }}</text>

    <!-- Axis labels -->
    <text :x="pl + iw / 2" :y="H - 2"
      text-anchor="middle" font-size="11" fill="#374151">n</text>
    <text :x="11" :y="pt + ih / 2"
      text-anchor="middle" font-size="11" fill="#374151"
      :transform="`rotate(-90, 11, ${pt + ih / 2})`">comparisons</text>

    <!-- n=8 marker -->
    <line :x1="sx(8)" :y1="pt" :x2="sx(8)" :y2="H - pb"
      stroke="#d1d5db" stroke-width="1" stroke-dasharray="4,3" />
    <text :x="sx(8) + 3" :y="pt + 10" font-size="9" fill="#9ca3af">n=8</text>

    <!-- Curves -->
    <path :d="dN2"    fill="none" stroke="#f59e0b" stroke-width="2.5" stroke-linejoin="round" />
    <path :d="dNlogN" fill="none" stroke="#3b82f6" stroke-width="2.5" stroke-linejoin="round" />

    <!-- Curve labels (at right end) -->
    <text :x="W - pr + 3" :y="sy(nMax * nMax) + 4"
      font-size="10" fill="#f59e0b" font-weight="600">O(n²)</text>
    <text :x="W - pr + 3" :y="sy(nMax * Math.log2(nMax)) + 4"
      font-size="10" fill="#3b82f6" font-weight="600">O(n log n)</text>

  </svg>
</template>
