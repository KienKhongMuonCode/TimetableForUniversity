<%-- 
    Document   : login
    Created on : Dec 9, 2022, 9:59:35 PM
    Author     : T490
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="./assets/css/bootstrap.min.css" rel="stylesheet">
        <link href="./assets/css/bootstrap.css" rel="stylesheet">
        <link rel="stylesheet" href="./assets/css/style.css">
        <title>Document</title>
    </head>
    <body>
        <div class="container">
            <div class="col-md-12">
                <h1><span>FPT University Academic Portal</span></h1>
                <ol class="breadcrumb">
                    <li>
                        <span></span>
                    </li>
                </ol>
                <div class="col-md-12">
                    <div style="border: solid 1px #ccc; height: 200px;">
                        <center>
                            <fieldset>
                                <legend>
                                    <span class="label  btn-warning">
                                        <b>Sinh viên, Giảng viên, Cán bộ ĐH-FPT</b>
                                    </span>
                                </legend>
                                <br>
                                <center>
                                    <div>
                                        <div class="row">
                                            <form action="login" method="POST">
                                                <label for="username"><b>Username: </b></label>
                                                <input type="text" placeholder="Enter Username" name="username" required value="${username}">
                                                <br/>
                                                <br/>
                                                <label for="password"><b>Password: </b></label>
                                                <input type="password" placeholder="Enter Password" name="password" required value="${password}">
                                                <br/>
                                                <label for="password">Remember Me</label>
                                                <input type="checkbox" name="remember">
                                                <br/>
                                                <input class="btn btn-primary" type="submit" value="Login"/>
                                            </form>
                                        </div>
                                    </div>
                                </center>
                            </fieldset>
                        </center>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
