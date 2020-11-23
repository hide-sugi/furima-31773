window.addEventListener('load', function(){
  
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", function(){
    const inputValue = priceInput.value;
    const addTaxDom = document.getElementById("add-tax-price");
    const salesProfit = document.getElementById("profit");
    addTaxDom.innerHTML = Math.floor(inputValue / 10);
    salesProfit.innerHTML = Math.floor(inputValue * (9 / 10));
  })
})
