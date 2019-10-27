*** Settings ***
Library    SeleniumLibrary    
Library    String

*** Keywords ***
Wait until page load success
    Wait Until Page Contains    Shopping-cart summary    5 seconds

Verify total product price
    [Arguments]    ${expect_total_products_price}
    ${total_products_price} =    Get Text    id:total_product
    ${total_products_price} =    String.Replace String    ${total_products_price}    $    ${EMPTY}    
    Should Be Equal As Strings    ${expect_total_products_price}    ${total_products_price}

Verify total shipping
    [Arguments]    ${expect_total_shipping}
    ${total_shipping} =    Get Text    id:total_shipping
    Should Be Equal As Strings    $${expect_total_shipping}    ${total_shipping}
 
Verify total price
    [Arguments]    ${expect_total_price} 
    ${total_price} =    Get Text    id:total_price
    Should Be Equal As Strings    $${expect_total_price}    ${total_price}  

Summary total price
    ${total_product} =    Get Text    id:total_product
    ${total_product} =    String.Replace String    ${total_product}    $    ${EMPTY}    
    ${total_product} =    Convert To Number    ${total_product}    

    ${total_shipping} =    Get Text    id:total_shipping
    ${total_shipping} =    String.Replace String    ${total_shipping}    $    ${EMPTY}
    ${total_shipping} =    Convert To Number    ${total_shipping}    

    ${total_tax} =    Get Text    id:total_tax
    ${total_tax} =    String.Replace String    ${total_tax}    $    ${EMPTY}
    ${total_tax} =    Convert To Number    ${total_tax}    
    
    ${total_price} =    Get Text    id:total_price
    ${total_price} =    String.Replace String    ${total_price}    $    ${EMPTY}
    ${total_price} =    Convert To Number    ${total_price}  
    
    ${expect_total_price} =    Evaluate    ${total_product} + ${total_shipping} + ${total_tax}    
    Should Be Equal As Numbers    ${expect_total_price}    ${total_price}    
    
  
    