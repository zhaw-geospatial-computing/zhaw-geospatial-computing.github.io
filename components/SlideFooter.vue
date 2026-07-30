<template>
  <div class="slide-footer">
    <slot />
  </div>
</template>

<style scoped>
.slide-footer {
  position: absolute;
  bottom: 0.75rem;
  left: 0;
  right: 0;
  padding: 0 4rem;
  font-size: 0.55em;
  color: #aaa;
  text-align: center;
}
</style>
