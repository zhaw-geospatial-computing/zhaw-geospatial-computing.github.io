<script setup lang="ts">
const props = defineProps({
  class: { type: String },
  layoutClass: { type: String },
})
</script>

<template>
  <div class="slidev-layout two-cols-header h-full flex flex-col px-16 py-12" :class="layoutClass">
    <div class="col-header flex-shrink-0">
      <slot />
    </div>
    <div class="cols flex-1 min-h-0 flex gap-6 mt-6">
      <div class="col" :class="props.class"><slot name="left" /></div>
      <div class="col" :class="props.class"><slot name="right" /></div>
    </div>
    <div class="col-bottom flex-shrink-0" :class="props.class">
      <slot name="bottom" />
    </div>
  </div>
</template>

<style>
.slidev-layout.two-cols-header .cols {
  overflow: hidden;
}

.slidev-layout.two-cols-header .col {
  flex: 1;
  min-width: 0;
  min-height: 0;
  overflow: hidden;
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: flex-start;
}

.slidev-layout.two-cols-header .col p {
  margin: 0;
}

.slidev-layout.two-cols-header .col p:has(img) {
  flex: 1;
  min-height: 0;
  display: flex;
  align-items: center;
  justify-content: center;
}

.slidev-layout.two-cols-header .col img {
  max-width: 100%;
  max-height: 100%;
  object-fit: contain;
}
</style>
