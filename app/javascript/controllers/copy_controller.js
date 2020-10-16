import { Controller } from 'stimulus'

export default class extends Controller{
    static targets= ['url'];

    copy() {
        navigator.clipboard.writeText(this.urlTarget.value);
    }
};