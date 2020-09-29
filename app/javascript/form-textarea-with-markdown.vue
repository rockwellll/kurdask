<template>
  <div class="flex flex-col w-full">
      <label for="question_description"></label>
      <p>هه‌وڵبده‌ زۆرترین زانیاری له‌سه‌ر کێشه‌که‌ت بنووسی</p>
      <small>پشتگیری markdown  ده‌کات</small>
      <textarea id="question_description" name="question[description]" v-model="content" class="resize-y" rows="10">

      </textarea>
      <vue-simple-markdown :source="content"></vue-simple-markdown>

  </div>
</template>

<script>
    export default {
        name: "form-textarea-with-markdown",
        props: ['label', 'oldValue'],
        data: () => ({
            content: ""
        }),
        mounted() {
            this.content = this.oldValue;
        }
    }
</script>

<style scoped>

</style>
