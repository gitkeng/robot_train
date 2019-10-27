*** Settings ***
Library    SeleniumLibrary
Resource    ../resources/common.resource
Resource    ../resources/home_page.resource
Resource    ../resources/order_page.resource
Resource    ../stepdefinitions/purchase_product_steps.resource
Suite Setup    eCommerce Suite Setup
Suite Teardown    Close All Browsers
Test Setup    eCommerce Test Setup
Test Teardown    Capture Page Screenshot    

*** Test Cases ***
Demo page rsource
    home_page.Add Product to shopping cart    1
    home_page.Checkout Product   
    order_page.Wait until page load success 
   
    order_page.Verify total product price    16.51
    order_page.Verify total shipping    2.00
    order_page.Verify total price    18.51
    Summary total price

Demo math
    ${result}    Evaluate    2 + 3    

Unauthen User checkout single product should calculate total price and shipping fee correctly
    #[Tags]    ignore
    Given Unauthen user add product "1" to shopping cart
    And Unauthen user add product "2" to shopping cart
    When I Checkout product
    Then I should see total product price equal to "16.51"
    # And I should see total shipping fee equal to "$2.00"
    # And I should see total price equal to "$18.51"
    # And I should see total price equal to summary price
    