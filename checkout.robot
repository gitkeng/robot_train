*** Settings ***
Library    SeleniumLibrary    
Library    String
Resource    resources/common.resource
Suite Setup    eCommerce Suite Setup
Suite Teardown    Close All Browsers
Test Setup    eCommerce Test Setup
Test Teardown    Capture Page Screenshot    

*** Test Cases ***
Normal User checkout single product should calculate total price and shipping fee correctly
    # Open Browser    url=${target_url}    browser=${browser}
    # Set Window Size    1920    1080
    # Maximize Browser Window
    # Mouse Over    css:#homefeatured a.product_img_link[title="Faded Short Sleeve T-shirts"] img 
    Mouse Over    xpath:(//div[@class="product-image-container"])[1]   
    Wait Until Page Contains Element    css:ul#homefeatured a[data-id-product="1"]    5 seconds        
    Click Link    css:ul#homefeatured a[data-id-product="1"]    
        
    Wait Until Element Is Visible    css:a[title="Proceed to checkout"]
    Click Link    css:a[title="Proceed to checkout"]
    Wait Until Page Contains    Shopping-cart summary    5 seconds
    ${total_products_price} =    Get Text    id:total_product
    ${total_products_price} =    String.Replace String    ${total_products_price}    $    ${EMPTY}    
    Should Be Equal As Strings    16.51    ${total_products_price}  
    
    ${total_shipping} =    Get Text    id:total_shipping
    Should Be Equal As Strings    $2.00    ${total_shipping}  

    ${total_price} =    Get Text    id:total_price
    Should Be Equal As Strings    $18.51    ${total_price}  

    # Close All Browsers
 
Normal User checkout multiple product should calculate total price and shipping fee correctly
    # Open Browser    url=${target_url}    browser=${browser}
    # Set Window Size    1920    1080
    # Maximize Browser Window
    # Mouse Over    css:#homefeatured a.product_img_link[title="Faded Short Sleeve T-shirts"] img 
    Mouse Over    xpath:(//div[@class="product-image-container"])[1]   
    Wait Until Page Contains Element    css:ul#homefeatured a[data-id-product="1"]    5 seconds        
    Click Link    css:ul#homefeatured a[data-id-product="1"]    
        
    Wait Until Element Is Visible    css:a[title="Proceed to checkout"]
    Click Link    css:a[title="Proceed to checkout"]
    Wait Until Page Contains    Shopping-cart summary    5 seconds


