<template>
    <div class="flex flex-col w-full flex-wrap">
        <label for="question_description"></label>
        <p>هه‌وڵبده‌ زۆرترین زانیاری له‌سه‌ر کێشه‌که‌ت بنووسی</p>
        <small>پشتگیری markdown ده‌کات</small>
        <div class="actions">
            <button type="button" @click.preventDefault="insertCode">Code</button>
            <button type="button" @click.preventDefault="insertBold">Bold</button>
            <button type="button" @click.preventDefault="insertItalic">Italic</button>
            <button type="button" @click.preventDefault="insertLink">link</button>
        </div>
        <textarea id="question_description" name="question[description]" v-model="content" class="resize-y rounded-none" rows="10">

      </textarea>
        <div>
            <vue-simple-markdown class="max-w-full" :source="content"></vue-simple-markdown>
        </div>
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
            this.content = this.oldValue || "";
        },
        methods: {
            insertCode(){
                this.content = this.content.concat("\n```\nکۆده‌که‌ت لێره‌ دابنێ\n```")
            },
            insertBold() {
                this.content = `${this.content} __لێره‌ نوسین بکه‌__ `;
            },
            insertItalic() {
                this.content = `${this.content} *لێره‌ نوسین بکه‌* `;
            },
            insertLink() {
                this.content = `${this.content} [لێره‌ نوسین بکه‌](لینک)`;
            }
        }
    }
</script>

<style scoped>

</style>
