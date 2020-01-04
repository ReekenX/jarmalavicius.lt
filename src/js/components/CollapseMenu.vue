<template>
  <div class="relative">
    <a href="javascript:void(0)" class="ml-8 relative" @click="onClick">
      {{ title }}
      <svg v-if="!collapsed" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" aria-hidden="true" focusable="false" width="1em" height="1em" class="inline-block" style="-ms-transform: rotate(360deg); -webkit-transform: rotate(360deg); transform: rotate(360deg);" preserveAspectRatio="xMidYMid meet" viewBox="0 0 24 24"><path d="M16.293 9.293L12 13.586L7.707 9.293l-1.414 1.414L12 16.414l5.707-5.707z" fill="#626262"/></svg>
      <svg v-else xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" aria-hidden="true" focusable="false" width="1em" height="1em" class="inline-block" style="-ms-transform: rotate(180deg); -webkit-transform: rotate(180deg); transform: rotate(180deg);" preserveAspectRatio="xMidYMid meet" viewBox="0 0 24 24"><path d="M16.293 9.293L12 13.586L7.707 9.293l-1.414 1.414L12 16.414l5.707-5.707z" fill="#626262"/></svg>
    </a>
    <slot name="body" v-if="collapsed" />
  </div>
</template>

<script>
export default {
  name: 'CollapseMenu',

  props: {
    title: {
      type: String,
      required: true,
    },
  },

  data: function() {
    return {
      collapsed: false,
    };
  },

  methods: {
    onClick() {
      this.collapsed = !this.collapsed;
    },
  },
};
</script>
