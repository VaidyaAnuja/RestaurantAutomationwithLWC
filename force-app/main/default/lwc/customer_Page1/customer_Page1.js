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
        for(var i=0; i<data.length; i++){
        let img = document.createElement("img");
        img.src= IMAGES + '/Starters/'+data[i].ImageName__c;
        img.style.width = "150px";
        img.style.height = "150px";
        img.style.marginRight = "20px";
        this.refs.myDiv.appendChild(img);
    }for(var i=0; i<data.length; i++){
        let lab = document.createElement("h4");
        lab.textContent = data[i].MasterLabel;
        this.refs.myDiv1.appendChild(lab);

        }
    } else if (error) {
        this.error = error;
    }

}
    
}