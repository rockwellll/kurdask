import {Controller} from "stimulus"
import marked from "marked"

export default class extends Controller {
    static targets = ["viewer", "input", "test"]

    insert(content) {
        const inputContent = this.inputTarget.value;

        const partBeforeCursor = inputContent.substring(0, this.inputTarget.selectionStart);
        const partAfterCursor = inputContent.substring(this.inputTarget.selectionStart + 1);


        this.inputTarget.value = `${partBeforeCursor} ${content} ${partAfterCursor}`;
        this.viewerTarget.innerHTML = marked(
             this.inputTarget.value,
            {sanitize: true}
        );

        this.inputTarget.focus();
        this.lastPush = content;
    }

    undoLastInsertion() {
        const value = this.inputTarget.value;

        this.inputTarget.value = value
            .substring(0, value.lastIndexOf(this.lastPush))
            .trim();
    }


    initialize() {
        this.viewerTarget.innerHTML = marked(this.data.get('old').trim() || "", {sanitize: true},);
        this.inputTarget.value = this.data.get('old')
        document.addEventListener('keypress', (e) => {
            if (e.ctrlKey && e.code === 'KeyZ') {
                this.undoLastInsertion();
            }
        });
    }

    convertToMarkdown(event) {
        this.viewerTarget.innerHTML = marked(event.target.value, {sanitize: true})
    }

    insertCode() {
        this.insert('\n```\nکۆده‌که‌ت لێره‌ دابنێ\n```')
    }

    insertBold() {
        this.insert('__لێره‌ نوسین بکه ‌__');
    }

    insertItalic() {
        this.insert('*لێره‌ نوسین بکه ‌*');
    }

    insertLink() {
        this.insert('[لێره‌ نوسین بکه‌](لینک)');
    }

    insertNewLine() {
        this.insert('``\n``\n');
    }
}
