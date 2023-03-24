<%-- 
    Document   : error_page
    Created on : Nov 5, 2022, 11:23:41 PM
    Author     : Anhnt206
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Error Page</title>
        <link href="./styles/error_style.css" rel="stylesheet"/>
    </head>
    <body style="margin: auto">
        <section class="page_404">
            <div class="container">
                <div class="row">	
                    <div class="col-sm-12 ">
                        <div class="col-sm-10 col-sm-offset-1  text-center">
                            <div class="four_zero_four_bg">
                                <h1 style="text-align: center" class="text-center ">404</h1>

                            </div>

                            <div class="contant_box_404">
                                <h3 class="h2">
                                    Look like you're lost
                                </h3>

                                <p>The page you are looking for not avaible!</p>
                                <div  style="font-size:17px;background-color: #cd2737;width: 220px;padding: 15px;border-radius: 15px;margin: 10px">
                                    <a style="color: white" href="${path}/home">
                                        <i style="font-size: 20px" class="fa fa-arrow-circle-left"></i> Go to Home Page
                                    </a>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </body>
</html>
