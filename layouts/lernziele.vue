<template>
  <div class="h-full px-16 py-12">
    <slot />
  </div>
</template>

<style scoped>
:deep(h1) {
  font-size: 2rem;
  font-weight: 700;
  color: #005A8C;
  border-left: 6px solid #005A8C;
  padding-left: 0.75rem;
  margin-bottom: 1.5rem;
  line-height: 1.2;
}

:deep(ul) {
  list-style: none;
  padding: 0;
  margin: 0;
  display: flex;
  flex-direction: column;
  gap: 1rem;
}

:deep(ul li) {
  position: relative;
  padding-left: 1.5rem;
  font-size: 1.1rem;
  line-height: 1.5;
  color: #222;
}

:deep(ul li)::before {
  content: '✓';
  color: #3a9e3a;
  font-weight: 700;
  position: absolute;
  left: 0;
}
</style>
