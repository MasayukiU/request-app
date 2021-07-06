window.addEventListener('load', () => {
  const priceInput = document.getElementById("price");
  const quantityInput = document.getElementById("quantity");
  
  priceInput.addEventListener("input", () => {
    const inputPrice = priceInput.value;
    const inputQuantity = quantityInput.value;
    const addTaxDom = document.getElementById("total_price");
    const totalPrice = inputPrice * inputQuantity;
    addTaxDom.value = Math.floor(totalPrice);
  });

  quantityInput.addEventListener("input", () => {
    const inputPrice = priceInput.value;
    const inputQuantity = quantityInput.value;
    const addTaxDom = document.getElementById("total_price");
    const totalPrice = inputPrice * inputQuantity;
    addTaxDom.value = Math.floor(totalPrice);
  });
});
