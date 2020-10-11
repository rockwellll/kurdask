import { Controller } from 'stimulus';

export default class extends Controller {
    static targets= ['count'];

    upvote() {
        console.log('should upvote');
        console.log(this.countTarget);
    }

    downvote() {
        console.log('should downvote')
    }
}