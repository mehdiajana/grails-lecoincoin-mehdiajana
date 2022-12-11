<html>
<head>
    <meta  content="main" />

    <asset:stylesheet src="login.css"/>

</head>

<body class="bd">
    <div class="main">
        <div >


        <form action="/login/authenticate" method="POST" id="loginForm" class="form1" autocomplete="off">

            <p>

                <input type="text" placeholder="Username" class="un" name="username" id="username">
            </p>

            <p>

                <input type="password" class="pass"  placeholder="Mot de passe" name="password" id="password">
            </p>



      <input type="submit" class="submit" id="submit"  value="Connexion">

        </form>    </div>
</div>

</body>
</html>
