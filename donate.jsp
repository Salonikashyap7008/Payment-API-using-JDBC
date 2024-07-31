<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://checkout.razorpay.com/v1/checkout.js"></script>
<title>Razorpay Payment</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
     
      <link rel="preconnect" href="https://fonts.googleapis.com">
      <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
      <link href="https://fonts.googleapis.com/css2?family=Calligraffitti&family=Francois+One&display=swap" rel="stylesheet">
     
      <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
            integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
      <style>
         body {
            margin: 60px;
            padding: 10px;
            background-color: #7DA2A9;
            height: 100vh;
            overflow: hidden;
            font-family: 'Noto Sans TC', sans-serif;
         }
         p {
            text-align: center;
            font-family: "Francois One", sans-serif;
            font-size: 28px;
            font-weight: bold;
         }
         .center {
            width: 430px;
            margin: 100px auto;
            position: relative;
         }
         .center .header {
            font-size: 28px;
            font-weight: bold;
            color: white;
            padding: 10px 0 15px 25px;
            background-color: #154360;
            border-bottom: 1px solid #370e3f;
            border-radius: 5px 5px 0 0;
         }
         .center form {
            position: absolute;
            background: white;
            width: 100%;
            padding: 50px 10px 0 30px;
            box-sizing: border-box;
            border: 1px solid #6d1c7d;
            border-radius: 0 0 5px 5px;
         }
         form input {
            height: 50px;
            width: 50%;
            padding: 0 10px;
            border-radius: 3px;
            border: 1px solid silver;
            font-size: 18px;
            outline: none;
         }
         form input[type="password"] {
            margin-top: 20px;
         }
         form i {
            position: absolute;
            font-size: 25px;
            color: grey;
            margin: 15px 0 0 -45px;
         }
         i.fa-lock {
            margin-top: 35px;
         }
         form input[type="submit"] {
            margin-top: 10px;
            margin-bottom: 40px;
            width: 130px;
            height: 45px;
            color: white;
            cursor: pointer;
            line-height: 45px;
            border-radius: 45px;
            border-radius: 5px;
            background: #154360;
         }
         form input[type="submit"]:hover {
            cursor: pointer;
            background: #7DA2A9;
            transition: .5s;
         }
         form a {
            text-decoration: none;
            font-size: 18px;
            color: black;
            padding: 0 0 0 20px;
         }
      </style>
</head>
<body>
<div id="order_id"></div>
<center>
     <p>Welcome user!</p>
    
    <form id="paymentForm" action="" method="post">
            <input type="text" placeholder="Email or Username" name="username" id="username">
            <i class="far fa-envelope"></i>
            <input id="pswrd" type="password" placeholder="Password" name="password">
            <i class="fas fa-lock"></i><br><br>
            <input id="phone" type="text" placeholder="Phone Number" name="phone">
            <i class='fas fa-mobile-alt'></i><br><br>
            <input type="text" placeholder="Amount to donate" name="amount" id="amount"><br><br>
         </form>
<button id="rzp-button1" class="btn btn-success">Pay</button>
</center>

<script>
document.getElementById("rzp-button1").addEventListener("click", function() {
    var username = document.getElementById("username").value;
    var amount = document.getElementById("amount").value;
    var phone = document.getElementById("phone").value;
 
        if (!username || !amount) {
        alert("Please fill in all the fields.");
        return;
    }
    
    var options = {
        "key": "rzp_live_RA2usjYYO353p2",
        "amount": amount * 100, 
        "currency": "INR",
        "name": "Saloni",
        "description": "Transaction Task",
        "image": "https://example.com/your_logo",
        "prefill": {
            "name": username,
            "email": username, 
            "contact": phone 
        },
        "notes": {
            "address": "Razorpay Corporate Office"
        },
        "theme": {
            "color": "#3399cc"
        }
    };
    var rzp1 = new Razorpay(options);
    rzp1.on('payment.failed', function(response) {
        alert(response.error.code);
        alert(response.error.description);
        alert(response.error.source);
        alert(response.error.step);
        alert(response.error.reason);
        alert(response.error.metadata.order_id);
        alert(response.error.metadata.payment_id);
    });
    rzp1.open();
});
</script>
</body>
</html> 