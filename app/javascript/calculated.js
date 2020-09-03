function calculation(){
  const item_price = document.getElementById("item-price")
  item_price.addEventListener('input', function() {
    const add_tax_form = document.getElementById("add-tax-price")
    const profit_form = document.getElementById("profit")
    let price = item_price.value
    add_tax_form.innerHTML = Math.floor(price / 10);
    profit_form.innerHTML = Math.floor(price - add_tax_form.innerHTML);
  });
};
setInterval(calculation, 1000);