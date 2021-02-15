function price (){
  const salesPrice = document.getElementById('item-price');
  this.addEventListener('keyup', () => {
    const tenPercent =  Math.floor(salesPrice.value * 0.1);
    const salesCommission = document.getElementById('add-tax-price');
    salesCommission.innerHTML = tenPercent;
    const difference = salesPrice.value - tenPercent;
    const salesProfit = document.getElementById('profit');
    salesProfit.innerHTML = difference;
  });
}

window.addEventListener('load', price);