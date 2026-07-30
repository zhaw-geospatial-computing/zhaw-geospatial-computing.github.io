<script setup>
import { computed } from 'vue'

const props = defineProps({
  heading: { type: String, default: '' },
  subtitle: { type: String, default: '' },
  authors: { type: String, default: '' },
  group: { type: String, default: 'Forschungsgruppe Geoinformatik' },
  institute: { type: String, default: 'Institut für Umwelt und Natürliche Ressourcen' },
  institution: { type: String, default: 'ZHAW Zürcher Hochschule für Angewandte Wissenschaften' },
  address: { type: String, default: 'Grüental, Postfach, CH-8820 Wädenswil' },
  email: { type: String, default: '' },
  logo: { type: String, default: null },
})

const logoSrc = computed(() => props.logo ?? `${import.meta.env.BASE_URL}zhaw-logo.jpeg`)
</script>

<template>
  <div class="h-full flex flex-col">
    <!-- Top gray section -->
    <div class="top flex flex-col justify-end px-16 pb-10">
      <p v-if="subtitle" class="subtitle">{{ subtitle }}</p>
      <h1 class="title">{{ heading }}</h1>
    </div>
    <!-- Bottom white section -->
    <div class="bottom flex items-center px-16 gap-12">
      <div class="shrink-0">
        <img :src="logoSrc" class="h-28 object-contain" alt="ZHAW Logo" />
      </div>
      <div class="info">
        <p v-if="authors" class="font-bold">{{ authors }}</p>
        <p>{{ group }}</p>
        <p class="mt-3">{{ institute }}</p>
        <p>{{ institution }}</p>
        <p>{{ address }}</p>
        <p v-if="email" class="mt-3">{{ email }}</p>
      </div>
    </div>
  </div>
</template>

<style scoped>
.top {
  flex: 3;
  background-color: #cbcbcb;
}

.subtitle {
  font-size: 1.35rem;
  color: #333;
  font-weight: 400;
  line-height: 1.4;
  margin: 0 0 1rem 0;
}

.title {
  font-size: 2.8rem;
  font-weight: 700;
  color: #111;
  margin: 0;
  line-height: 1.2;
}

.bottom {
  flex: 2;
  background-color: white;
}

.info {
  font-size: 0.85rem;
  line-height: 1.6;
  color: #005A8C;
}

.info p {
  margin: 0;
}
</style>
