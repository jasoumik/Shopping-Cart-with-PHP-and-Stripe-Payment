<?php
include('db.php');
session_start();
if(isset($_POST["token"])){
    require_once 'vendor/autoload.php';
    \Stripe\Stripe::setApiKey('sk_test_51GxKahJGONcE1avp7zL3OcT9NV5uyAJE1JfFDA1fVQr8gZTiQzqD0bfS0SLRA0eQDGrpNoE6EFMd3h3mvlGP8TZK00Ld3OsUvB');
    $customer=\Stripe\Customer::create(array(
        'email'   => $_POST["email_address"],
        'source'  => $_POST["token"],
        'name'   => $_POST["customer_name"],
        'address'  => array(
         'line1'   => $_POST["customer_address"],
         'postal_code' => $_POST["customer_pin"],
         'city'   => $_POST["customer_city"],
         'state'   => $_POST["customer_state"],
         'country'  => 'US'
        ) 
    ));
    $order_number=rand(100000,999999);
    $charge=\Stripe\Charge::create(array(
        'customer'   => $customer->id,
        'amount'     =>$_POST["total_amount"]*100,
        'currency'  =>$_POST["currency_code"],
        'description' =>$_POST["item_details"],
        'metadata'  =>array(
            'order_id' => $order_number
        )
    ));
    $response =$charge->jsonSerialize();
    if($response["amount_refunded"]==0 && empty($response["failure_code"])&&
    $response["paid"]==1 && $response["captured"]==1 && 
    $response["status"]=='succeeded'){
        $amount= $response["amount"]/100;
        $order_data =array(
            ':order_number'   => $order_number,
            ':order_total_amount' => $amount,
            ':transaction_id'  => $response["balance_transaction"],
            ':card_cvc'    => $_POST["card_cvc"],
            ':card_expiry_month' => $_POST["card_expiry_month"],
            ':card_expiry_year'  => $_POST["card_expiry_year"],
            ':order_status'   => $response["status"],
            ':card_holder_number' => $_POST["card_holder_number"],
            ':email_address'  => $_POST['email_address'],
            ':customer_name'  => $_POST["customer_name"],
            ':customer_address'  => $_POST['customer_address'],
            ':customer_city'  => $_POST['customer_city'],
            ':customer_pin'   => $_POST['customer_pin'],
            ':customer_state'  => $_POST['customer_state'],
            ':customer_country'  => $_POST['customer_country']
        );
        $query = "
        INSERT INTO order_table 
            (order_num,order_total_amnt,tran_id,card_cvc,card_exp_m,
            card_exp_y,order_status,card_holder_num,email,cus_name,
            cus_adrs,cus_city,cus_pin,cus_state,cus_country
            ) 
            VALUES (:order_number, :order_total_amount, 
            :transaction_id, :card_cvc, :card_expiry_month, 
            :card_expiry_year, :order_status, :card_holder_number,
             :email_address, :customer_name, :customer_address,
              :customer_city, :customer_pin, :customer_state, :customer_country)
        ";

        $statement = $connect->prepare($query);

        $statement->execute($order_data);

        $order_id = $connect->lastInsertId();

        foreach($_SESSION["shopping_cart"] as $keys => $values)
        {
        $order_item_data = array(
            ':order_id'  => $order_id,
            ':order_item_name' => $values["pdt_name"],
            ':order_item_quantity' => $values["pdt_qnty"],
            ':order_item_price' => $values["pdt_price"]
        );

        $query = "
        INSERT INTO order_item 
        (order_id, order_item_name, order_item_qnty, order_item_price) 
        VALUES (:order_id, :order_item_name, :order_item_quantity, :order_item_price)
        ";

        $statement = $connect->prepare($query);

        $statement->execute($order_item_data);
        }

        unset($_SESSION["shopping_cart"]);

        $_SESSION["success_message"] = "Payment is completed successfully. The TXN ID is " . $response["balance_transaction"] . "";
        header('location:index.php');
    }
}
?>