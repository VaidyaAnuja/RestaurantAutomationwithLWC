import { LightningElement, track } from 'lwc';
export default class TabsetBasic extends LightningElement {
    section = '';
    handleSectionToggle(event) {
        this.section = event.detail.openSections;
    }
    handleClick(event){
       this.template.querySelector('lightning-tabset').activeTabValue = event.target.value;
   }
   
}