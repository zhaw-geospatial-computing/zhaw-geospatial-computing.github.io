<script setup>
import { useNav } from '@slidev/client'
import { computed } from 'vue'

const props = defineProps({
  active: { type: Number, default: 0 },
})

const { slides } = useNav()
const items = computed(() => slides.value[0]?.meta?.slide?.frontmatter?.sections ?? [])
</script>

<template>
  <div class="inhalt">
    <h1>Inhalt</h1>
    <ol>
      <li
        v-for="(item, i) in items"
        :key="i"
        :class="{
          'is-active': i + 1 === active,
          'is-dim': active > 0 && i + 1 !== active,
        }"
      >{{ item }}</li>
    </ol>
  </div>
</template>

<style scoped>
.inhalt h1 {
  font-size: 2rem;
  font-weight: 700;
  margin-bottom: 1.5rem;
}

.inhalt ol {
  list-style: decimal;
  padding-left: 1.5rem;
  display: flex;
  flex-direction: column;
  gap: 0.75rem;
  font-size: 1.2rem;
}

.inhalt li.is-active {
  font-weight: 700;
}

.inhalt li.is-dim {
  opacity: 0.35;
}
</style>
