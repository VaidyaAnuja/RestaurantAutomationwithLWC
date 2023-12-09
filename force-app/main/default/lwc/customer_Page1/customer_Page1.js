import { LightningElement, track, wire, api} from 'lwc';
import IMAGES from "@salesforce/resourceUrl/static_images";
import getStarters from "@salesforce/apex/Customer_Page.getStarters";
export default class TabsetBasic extends LightningElement {
    section = '';
    handleSectionToggle(event) {
        this.section = event.detail.openSections;
    }
    handleClick(event){
       this.template.querySelector('lightning-tabset').activeTabValue = event.target.value;
   }
   starters = '';
   @wire(getStarters)
    wiredStarters({ error, data }) {
    if (data) {
        this.starters = IMAGES + '/Starters/'+data[0].ImageName__c;
    } else if (error) {
        this.error = error;
    }

}
    //companyLogo = IMAGES + '/Starters/paneer-tikka-skewers.jpg';
    
}