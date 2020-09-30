<template>
    <div class="flex flex-col w-full flex-wrap my-2">
        <label for="question_description" class="mb-2">هه‌وڵبده‌ زۆرترین زانیاری له‌سه‌ر کێشه‌که‌ت بنووسی</label>

        <div class="actions flex justify-between">
            <div>
                <button type="button" @click.preventDefault="insertCode"
                        class="outline-none focus:outline-none ml-1">
                    <svg class="h-3 w-3" version="1.1" id="Layer_1" xmlns="http://www.w3.org/2000/svg"
                         xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
                         viewBox="0 0 512 512" style="enable-background:new 0 0 512 512;" xml:space="preserve">
                        <g>
                            <path d="M109.9,135.5L7.5,237.9C2.7,242.7,0,249.3,0,256c0,6.7,2.7,13.3,7.5,18.1l102.4,102.4c10,10,26.2,10,36.2,0
                                c10-10,10-26.2,0-36.2L61.8,256l84.3-84.3c10-10,10-26.2,0-36.2S119.9,125.5,109.9,135.5L109.9,135.5z"/>
                            <path d="M365.9,171.7l84.3,84.3l-84.3,84.3c-10,10-10,26.2,0,36.2s26.2,10,36.2,0l102.4-102.4c4.8-4.8,7.5-11.4,7.5-18.1
                                c0-6.7-2.7-13.3-7.5-18.1L402.1,135.5c-10-10-26.2-10-36.2,0C355.9,145.5,355.9,161.7,365.9,171.7L365.9,171.7z"/>
                            <path d="M282.4,45L180,454.6c-3.4,13.7,4.9,27.6,18.6,31s27.6-4.9,31-18.6L332,57.4c3.4-13.7-4.9-27.6-18.6-31
                                C299.7,22.9,285.8,31.3,282.4,45"/>
                        </g>
                    </svg>
                </button>

                <button type="button" @click.preventDefault="insertBold"
                        class="focus:outline-none border-none mx-2">
                    <svg version="1.1" id="Layer_1" xmlns="http://www.w3.org/2000/svg"
                         xmlns:xlink="http://www.w3.org/1999/xlink" class="h-3 w-3"
                         viewBox="0 0 512 512" style="enable-background:new 0 0 512 512;" xml:space="preserve">
                        <g>
                            <path d="M347,240.7c36.6,6.3,71.4,20.3,102.2,41.1c27.4,21.3,43,54.4,42.1,89c0.6,37.1-16.3,72.3-45.7,95
                                c-48.1,33.3-106,49.4-164.3,45.7H20.7v-13.8c16.3,1.2,32.6-1.1,48-6.6c7.6-3.6,13.9-9.6,17.7-17.1c4.5-16.9,6.2-34.5,4.9-51.9V90.6
                                C92.7,72.9,91,55.1,86.4,38c-3.8-7.6-10.1-13.6-17.7-17.1c-15.4-5.4-31.7-7.7-48-6.6V0.5h244.8c42-2.3,84.1,3,124.2,15.8
                                C413,25.9,433,42.1,447.2,63c13.5,19.3,20.9,42.2,21,65.7c0,24.5-9.5,48.1-26.6,65.7C415,218.4,382.3,234.4,347,240.7z M210,259.8
                                v182.7c-0.8,11.2,3,22.2,10.5,30.5c8.4,7.3,19.4,11,30.6,10.2c19.3,0.2,38.4-4.5,55.5-13.5c17.1-8.3,31.3-21.8,40.4-38.5
                                c9.2-17.5,13.8-37.1,13.5-56.8c0.7-23-5-45.7-16.4-65.7c-10.1-18.2-26.3-32.2-45.7-39.8c-28.5-8.3-58.2-11.4-87.7-9.2H210z
                                 M210,230.5c26.8,1.4,53.7-2.7,78.9-12.2c15.9-6.9,29.5-18.3,39.1-32.9c9.6-17,14.3-36.3,13.5-55.8c0.8-19.4-3.9-38.6-13.5-55.5
                                c-9.1-14.6-22.4-26-38.1-32.9c-25.6-8.9-52.8-12.6-79.8-10.8V230.5z"/>
                        </g>
                    </svg>
                </button>

                <button type="button" @click.preventDefault="insertItalic"
                        class="focus:outline-none border-none mx-2">
                    <svg class="h-3 w-3" version="1.1" id="Layer_1" xmlns="http://www.w3.org/2000/svg"
                         xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
                         viewBox="0 0 512 512" style="enable-background:new 0 0 512 512;" xml:space="preserve">
                        <g>
                            <path d="M300.8,498.2l-4.2,13.8H85.7l5.1-13.8c14.1,0.5,28.2-1.4,41.7-5.5c9.7-3.3,18.2-9.5,24.4-17.6c11.7-20,20.4-41.6,25.7-64.2
                                l88.9-308.5c6.3-18.8,10-38.3,11.2-58.1c0.2-5.9-1.5-11.8-4.8-16.7c-3.8-4.8-8.9-8.4-14.8-10.3c-12.8-3-26-4.2-39.2-3.5L228.6,0
                                h197.7l-4.2,13.8c-12.2-0.8-24.5,1-35.9,5.5c-10.6,4.4-19.7,11.9-26,21.5c-9.9,19.7-17.6,40.5-22.8,62l-88,309.1
                                c-6.1,17.6-10.4,35.8-12.8,54.2c-0.2,5.7,1.5,11.4,4.8,16c3.8,4.9,9.1,8.5,15.1,10.3C271,496,285.8,497.9,300.8,498.2z"/>
                        </g>
                    </svg>
                </button>

                <button type="button"
                        @click.preventDefault="insertLink"
                        class="focus:outline-none border-none mx-2">
                    <svg class="h-3 w-3" version="1.1" id="Layer_1" xmlns="http://www.w3.org/2000/svg"
                         xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
                         viewBox="0 0 512 512" style="enable-background:new 0 0 512 512;" xml:space="preserve">
                        <g id="XMLID_6_">
                            <path id="XMLID_11_" d="M49.1,255.6c0-43.8,35.9-78.9,78.9-78.9h102.6v-48.2H128c-71,0-128,57-128,128c0,70.1,57,128,128,128h102.6
                                v-50H128C84.2,334.5,49.1,299.4,49.1,255.6z M153.4,281h204.3v-50.8H153.4V281z M384,127.6H281.4v49.1H384
                                c43.8,0,78.9,35.9,78.9,78.9S427,334.5,384,334.5H281.4v48.2H384c70.1,0,128-57,128-128C512,184.5,454.1,127.6,384,127.6z"/>
                        </g>
                    </svg>
                </button>

                <button type="button"
                        @click.preventDefault="insertNewLine"
                        class="focus:outline-none border-none mx-2">
                    <svg class="h-3 w-3" version="1.1" id="Layer_1" xmlns="http://www.w3.org/2000/svg"
                         xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
                         viewBox="0 0 512 512" style="enable-background:new 0 0 512 512;" xml:space="preserve">
                        <g>
                            <path class="st0" d="M494.1,0C504,0,512,8,512,17.9v211.9c0,94.7-76.8,171.5-171.5,171.5l-281.5,0l80.2,80.1c7,7,7,18.3,0,25.3
                                c-7,7-18.3,7-25.3,0L5.3,398.2c-7-7-7-18.3,0-25.3l108.6-108.6c7-7,18.3-7,25.3,0c7,7,7,18.3,0,25.3l-75.9,75.9h277.2
                                c74.9,0,135.6-60.7,135.6-135.6V17.9C476.2,8,484.2,0,494.1,0z"/>
                        </g>
                    </svg>
                </button>

            </div>
            <small class="text-primary">پشتگیری markdown ده‌کات</small>
        </div>
        <textarea ref="input" id="question_description" name="question[description]" v-model="content" class="resize-y"
                  rows="10">

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
            content: "",
            lastPush: null
        }),
        mounted() {
            this.content = this.oldValue || "";

            document.addEventListener('keypress', (e) => {
                if (e.ctrlKey && e.code === 'KeyZ') {
                    this.undoLastInsertion();
                }
            });
        },
        destroyed() {
            document.removeEventListener('keypress');
        },
        methods: {
            insertCode() {
                this.insert('\n```\nکۆده‌که‌ت لێره‌ دابنێ\n```')
            },
            insertBold() {
                this.insert('__لێره‌ نوسین بکه‌__');
            },
            insertItalic() {
                this.insert('*لێره‌ نوسین بکه‌*');
            },
            insertLink() {
                this.insert('[لێره‌ نوسین بکه‌](لینک)');
            },
            insertNewLine() {
                this.insert('``\n``\n');
            },
            insert(content) {
                this.content = `${this.content} ${content}`;
                this.lastPush = content;
                this.$refs.input.focus();
            },
            undoLastInsertion() {
                this.content = this.content.substring(0, this.content.indexOf(this.lastPush)).trim();
            }
        }
    }
</script>

<style scoped>
    .st0 {
        fill: #555555;
    }
</style>
