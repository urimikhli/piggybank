window.addEventListener('load', eventWindowLoaded, false);
function eventWindowLoaded() {

    addEventListnersToStuff();
}


function addEventListnersToStuff() {
    var redemptionLink = document.getElementById("redeemPoints");
    
    if (redemptionLink != null) {
        redemptionLink.addEventListener('click',confirmRedeem,false);
    }
}


function confirmRedeem() {
    alert("CONGRATULATIONS!!  \n You are redeeming your points ");
}