import {Controller} from 'stimulus';
import axios from 'axios';

export default class extends Controller {
    static targets = ['count', 'up', 'down'];

    async upvote() {
        const res = await axios.post('/upvote', {
            entityId: this.data.get('entity'),
            entityType: this.data.get('type'),
        }, {
            headers: {
                "X-CSRF-Token": this.csrf()
            }
        });

        this.respondToRequest(res, this.upTarget);
    }

    async downvote() {
        const res = await axios.post('/downvote', {
            entityId: this.data.get('entity'),
            entityType: this.data.get('type'),
        }, {
            headers: {
                "X-CSRF-Token": this.csrf()
            }
        });

        this.respondToRequest(res, this.downTarget);
    }

    csrf() {
        const element = document.head.querySelector(`meta[name="csrf-token"]`)
        return element.getAttribute("content")
    }

    respondToRequest(response, target) {
        if(!response.data.success) {
            document.getElementById('banner-content').innerText= response.data.message;
            document.getElementById('banner').classList.add('flash');
            window.scrollTo(0, 0);
            return;
        }

        if (response.data.success) {
            this.countTarget.innerHTML = response.data.count;
        }

        if (response.data.success && response.data.toggle) {
            target.classList.add('text-accent');
        }

        if (response.data.success && !response.data.toggle) {
            target.classList.remove('text-accent');
        }
    }
}