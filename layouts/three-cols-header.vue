<template>
  <div class="slidev-layout three-cols-header h-full flex flex-col px-16 py-12">
    <div class="header flex-shrink-0">
      <slot />
    </div>
    <div class="cols flex-1 min-h-0 flex gap-6 mt-6">
      <div class="col"><slot name="left" /></div>
      <div class="col"><slot name="center" /></div>
      <div class="col"><slot name="right" /></div>
    </div>
  </div>
</template>

<style>
.slidev-layout.three-cols-header .cols {
  overflow: hidden;
}

.slidev-layout.three-cols-header .col {
  flex: 1;
  min-width: 0;
  min-height: 0;
  overflow: hidden;
  display: flex;
  align-items: center;
  justify-content: center;
}

.slidev-layout.three-cols-header .col p {
  height: 100%;
  display: flex;
  align-items: center;
  justify-content: center;
  margin: 0;
}

.slidev-layout.three-cols-header .col img {
  max-width: 100%;
  max-height: 100%;
  object-fit: contain;
}
</style>
