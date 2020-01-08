<template>
  <div @click="onClick">
    <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" aria-hidden="true" focusable="false" width="2em" height="2em" class="sm:hidden" preserveAspectRatio="xMidYMid meet" viewBox="0 0 20 20"><path d="M3 11h14V9H3v2zm0 5h14v-2H3v2zM3 4v2h14V4H3z" fill="#626262" /></svg>
    <slot name="body" v-if="collapsed" />
  </div>
</template>

<script>
export default {
  name: 'MobileMenu',

  data: function() {
    return {
      collapsed: false,
    };
  },

  methods: {
    onClick() {
      this.collapsed = !this.collapsed;

      // Toggle scrolling of body
      if (this.collapsed) {
        window.document.body.classList.add('fixed');
      } else {
        window.document.body.classList.remove('fixed');
      }
    },
  },
};
</script>
