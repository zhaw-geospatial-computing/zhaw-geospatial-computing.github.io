<template>
  <div class="h-full px-16 py-12">
    <slot />
  </div>
</template>

<style scoped>
:deep(h1) {
  font-size: 2rem;
  font-weight: 700;
  color: #C05A00;
  border-left: 6px solid #C05A00;
  padding-left: 0.75rem;
  margin-bottom: 1.5rem;
  line-height: 1.2;
}

:deep(h2) {
  font-size: 1.1rem;
  font-weight: 600;
  color: #C05A00;
  margin-bottom: 0.75rem;
}

:deep(ul),
:deep(ol) {
  padding-left: 1.5rem;
  margin: 0;
  display: flex;
  flex-direction: column;
  gap: 0.75rem;
}

:deep(li) {
  font-size: 1.1rem;
  line-height: 1.5;
  color: #222;
}
</style>
