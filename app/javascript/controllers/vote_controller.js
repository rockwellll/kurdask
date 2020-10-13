import {Controller} from 'stimulus';
import axios from 'axios';

export default class extends Controller {
    static targets = ['count'];

    async upvote() {
        const res = await axios.post('/upvote', {
            entityId: this.data.get('entity'),
            entityType: this.data.get('type'),
        }, {
            headers: {
                "X-CSRF-Token": this.csrf()
            }
        });

        console.log(res);
        // if (res.data.success && res.data.toggle) {
        //     this.countTarget.innerHTML = res.data.count;
        // }

        // if (res.data.success && !res.data.toggle) {
        //     document.getElementById('banner-content').innerText= res.data.message;
        //     document.getElementById('banner').classList.add('flash');
        // }

        if (res.data.success) {
            this.countTarget.innerHTML = res.data.count;
        }
    }

    async downvote() {
        const res = await axios.post('/downvote', {
            entityId: this.data.get('entity'),
            entityType: this.data.get('type'),
        }, {
            headers: {
                "X-CSRF-Token": this.csrf()
            }
        })

        if (res.data.success) {
            this.countTarget.innerHTML = res.data.count;
        }

        // if (res.data.success && res.data.toggle) {
        //     this.countTarget.innerHTML = res.data.count;
        // }
        //
        // if (!res.data.success) {
        //     document.getElementById('banner-content').innerText= res.data.message;
        //     document.getElementById('banner').classList.add('flash');
        // }
    }

    csrf() {
        const element = document.head.querySelector(`meta[name="csrf-token"]`)
        return element.getAttribute("content")
    }
}