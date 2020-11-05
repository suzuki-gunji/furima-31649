function post (){
  const itemPrice = document.getElementById("item-price")
  itemPrice.addEventListener("input", () => {
    let amount = itemPrice.value
    const taxPrice = document.getElementById("add-tax-price")
    taxPrice.innerHTML = Math.floor(amount * 0.1)
    const profitPrice = document.getElementById("profit")
    profitPrice.innerHTML = Math.floor(amount * 0.9)
  })
}

window.addEventListener('load', post)
