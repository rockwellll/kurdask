import { Controller } from 'stimulus';
import axios from 'axios';

export default class extends Controller {
    static targets = ['input', 'username', 'editButton', 'cancelButton', 'saveButton', 'error'];

    initialize() {
        document.addEventListener('keypress', e => {
            if (e.code === 'Enter' && !this.inputTarget.classList.contains('hidden')) {
                this.save();
            }
        })
    }

    showInput() {
        this.inputTarget.classList.remove('hidden');
        this.cancelButtonTarget.classList.remove('hidden');
        this.saveButtonTarget.classList.remove('hidden');
        this.hideDefaultElements();
    }

    cancel() {
        this.showDefaultElements();

        this.inputTarget.classList.add('hidden');
        this.cancelButtonTarget.classList.add('hidden');
        this.saveButtonTarget.classList.add('hidden');
        this.errorTarget.classList.add('hidden');
    }

    showDefaultElements() {
        this.usernameTarget.classList.remove('hidden');
        this.editButtonTarget.classList.remove('hidden');
    }

    hideDefaultElements() {
        this.usernameTarget.classList.add('hidden');
        this.editButtonTarget.classList.add('hidden');
    }

    async save() {
        const { data } = await axios.patch(`/users/${this.data.get('initial')}`, {
            newUsername: this.inputTarget.value
        }, {
            headers: {
                'X-CSRF-TOKEN': this.csrf()
            }
        }
        );

        if (data.success) {
            window.location = data.url;
            return;
        }

        this.errorTarget.innerText = data.message;
        this.errorTarget.classList.remove('hidden');
    }

    csrf() {
        const element = document.head.querySelector(`meta[name="csrf-token"]`)
        return element.getAttribute("content")
    }
}