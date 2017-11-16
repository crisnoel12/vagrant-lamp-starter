<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Vagrant Lamp Starter</title>
    <link href='https://fonts.googleapis.com/css?family=Montserrat' rel='stylesheet' type='text/css'>
    <style media="screen">
        body{
            background: #FFEB3B;
            font-size: 16px;
        }
        h1, h2, li{
            font-family: 'Montserrat', sans-serif;
        }
        h1{
            position: absolute;
            left: 50%;
            top: 20px;
            transform: translateX(-50%);
            font-size: 4em;
            letter-spacing: .3em;
        }
        h1:before, h1:after{
            content: "";
            position: absolute;
            border-top: 4px solid black;
            width: 80%;
            top: 50%;
        }
        h1:before{
            right: 80%;
            margin-right: 80px;
        }
        h1:after{
            left: 80%;
            margin-left: 80px;
        }
        .packages{
            position: absolute;
            top: 40%;
            left: 50%;
            transform: translate(-50%, -40%);
        }
        h2{
            font-size: 2.5em;
            margin-bottom: 0;
        }
        li{
            font-size: 1.5em;
        }
    </style>
</head>
<body>
    <h1>LAMP</h1>
    <div class="packages">
        <h2>Included Packages:</h2>
        <ul>
            <li>Ubuntu 16.04</li>
            <li>Apache 2</li>
            <li>MySQL</li>
            <li>PHP 7</li>
            <li>Python 2.7</li>
            <li>PhpMyAdmin</li>
            <li>Git</li>
            <li>Composer</li>
        </ul>
        <i><b>*Note: You can add or remove packages from the pre-existing <br> packages array inside lamp.sh</b></i>
    </div>

</body>
</html>
