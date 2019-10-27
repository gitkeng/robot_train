*** Settings ***
Library    SeleniumLibrary   
Library    String     

*** Keywords ***
Add Product to shopping cart
    [Arguments]    ${product_id}
    Mouse Over    xpath:(//div[@class="product-image-container"])[${product_id}]   
    Wait Until Page Contains Element    css:ul#homefeatured a[data-id-product="${product_id}"]    5 seconds        
    Click Link    css:ul#homefeatured a[data-id-product="${product_id}"]

Checkout Product
    Wait Until Element Is Visible    css:a[title="Proceed to checkout"]
    Click Link    css:a[title="Proceed to checkout"]
        