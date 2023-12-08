import { LightningElement, track, wire, api} from 'lwc';
import IMAGES from "@salesforce/resourceUrl/static_images";
export default class TabsetBasic extends LightningElement {
    section = '';
    handleSectionToggle(event) {
        this.section = event.detail.openSections;
    }
    handleClick(event){
       this.template.querySelector('lightning-tabset').activeTabValue = event.target.value;
   }
    companyLogo = IMAGES + '/Starters/paneer-tikka-skewers.jpg';
    
}