*** Settings ***
Library    SeleniumLibrary
Resource    ../resources/home_page.resource    
Resource    ../resources/order_page.resource

*** Keywords ***
Unauthen user add product "${product_id}" to shopping cart
    home_page.Add Product to shopping cart    ${product_id}

I Checkout product
    home_page.Checkout Product
    order_page.Wait until page load success 

I should see total product price equal to "${product_price}"
    order_page.Verify total product price    ${product_price}