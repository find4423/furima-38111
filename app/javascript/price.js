window.addEventListener('load', () => {
  const price = document.getElementById("item-price");
  const commission = document.getElementById("add-tax-price");
  const profit = document.getElementById("profit");
  price.addEventListener("input", () => {
    const input = price.value;
    commission.innerHTML = `${Math.floor(input *  (1/10)) }`;
    profit.innerHTML = `${Math.floor(input - input * (1/10))}`;
  }); 
 });